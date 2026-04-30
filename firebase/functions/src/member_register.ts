import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import * as bcrypt from 'bcryptjs';
import { executeQuery, executeMutation } from './data_connect';

const BCRYPT_ROUNDS = 12;

interface RegisterRequest {
  name: string;
  phone: string;
  email: string;
  password: string;
  associationId: string;
}

interface MemberForAuth {
  id: string;
}

interface GetMemberForAuthData {
  members: MemberForAuth[];
}

const kGetMemberForAuth = `query GetMemberForAuth($associationId: UUID!, $email: String!) {
  members(where: { associationId: { eq: $associationId }, email: { eq: $email } }, limit: 1) {
    id name phone email isBlocked passwordHash
  }
}`;

export const memberRegister = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { name, phone, email, password, associationId } = request.data as RegisterRequest;

    if (!name || !phone || !email || !password || !associationId) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    if (password.length < 6) {
      throw new HttpsError('invalid-argument', 'Password must be at least 6 characters');
    }

    const existing = await executeQuery<GetMemberForAuthData>(kGetMemberForAuth, { associationId, email });

    if (existing.members.length > 0) {
      throw new HttpsError('already-exists', 'Member already registered for this association');
    }

    const passwordHash = await bcrypt.hash(password, BCRYPT_ROUNDS);

    await executeMutation(
      `mutation RegisterMember(
        $associationId: UUID!, $name: String!, $phone: String!, $email: String!, $passwordHash: String!
      ) {
        member_insert(data: {
          associationId: $associationId name: $name phone: $phone email: $email
          passwordHash: $passwordHash role: MEMBER status: "pending" isBlocked: false isFounder: false
        })
      }`,
      { associationId, name, phone, email, passwordHash },
    );

    const created = await executeQuery<GetMemberForAuthData>(kGetMemberForAuth, { associationId, email });
    const memberId = created.members[0].id;

    const token = await admin.auth().createCustomToken(memberId, { memberId, associationId });
    return { token, memberId };
  },
);
