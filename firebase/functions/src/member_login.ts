import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import * as bcrypt from 'bcryptjs';
import { executeQuery } from './data_connect';

interface LoginRequest {
  email: string;
  password: string;
  associationId: string;
}

interface MemberForAuth {
  id: string;
  name: string;
  phone: string;
  email: string;
  isBlocked: boolean;
  passwordHash: string | null;
}

interface GetMemberForAuthData {
  members: MemberForAuth[];
}

const kGetMemberForAuth = `query GetMemberForAuth($associationId: UUID!, $email: String!) {
  members(where: { associationId: { eq: $associationId }, email: { eq: $email } }, limit: 1) {
    id name phone email isBlocked passwordHash
  }
}`;

export const memberLogin = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { email, password, associationId } = request.data as LoginRequest;

    if (!email || !password || !associationId) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    const result = await executeQuery<GetMemberForAuthData>(kGetMemberForAuth, { associationId, email });
    const member = result.members[0];

    if (!member || !member.passwordHash) {
      throw new HttpsError('unauthenticated', 'Invalid credentials');
    }

    if (member.isBlocked) {
      throw new HttpsError('unauthenticated', 'Invalid credentials');
    }

    const passwordMatch = await bcrypt.compare(password, member.passwordHash);
    if (!passwordMatch) {
      throw new HttpsError('unauthenticated', 'Invalid credentials');
    }

    const token = await admin.auth().createCustomToken(member.id, {
      memberId: member.id,
      associationId,
    });

    return { token, memberId: member.id };
  },
);
