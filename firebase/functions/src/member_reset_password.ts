import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import * as bcrypt from 'bcryptjs';
import { executeQuery, executeMutation } from './data_connect';

const BCRYPT_ROUNDS = 12;
const MAX_RESET_USES = 5;

interface ResetPasswordRequest {
  email: string;
  associationId: string;
  token: string;
  newPassword: string;
}

interface MemberForAuth {
  id: string;
  passwordResetToken: string | null;
  passwordResetTokenExpiresAt: string | null;
  passwordResetTokenUses: number | null;
}

interface GetMemberForAuthData {
  members: MemberForAuth[];
}

export const memberResetPassword = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { email, associationId, token, newPassword } = request.data as ResetPasswordRequest;

    if (!email || !associationId || !token || !newPassword) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    if (newPassword.length < 6) {
      throw new HttpsError('invalid-argument', 'Password must be at least 6 characters');
    }

    const result = await executeQuery<GetMemberForAuthData>(
      `query GetMemberForAuth($associationId: UUID!, $email: String!) {
        members(where: { associationId: { eq: $associationId }, email: { eq: $email } }, limit: 1) {
          id passwordResetToken passwordResetTokenExpiresAt passwordResetTokenUses
        }
      }`,
      { associationId, email },
    );

    const member = result.members[0];

    if (!member || !member.passwordResetToken) {
      throw new HttpsError('not-found', 'No active reset token');
    }

    const uses = member.passwordResetTokenUses ?? 0;

    if (uses >= MAX_RESET_USES) {
      throw new HttpsError('resource-exhausted', 'Too many attempts');
    }

    if (member.passwordResetToken !== token) {
      await executeMutation(
        `mutation UpdateMemberPasswordResetUses($memberId: UUID!, $uses: Int!) {
          member_update(id: $memberId, data: { passwordResetTokenUses: $uses })
        }`,
        { memberId: member.id, uses: uses + 1 },
      );
      throw new HttpsError('unauthenticated', 'Invalid token');
    }

    if (!member.passwordResetTokenExpiresAt || new Date(member.passwordResetTokenExpiresAt) < new Date()) {
      throw new HttpsError('deadline-exceeded', 'Token expired');
    }

    const passwordHash = await bcrypt.hash(newPassword, BCRYPT_ROUNDS);

    await executeMutation(
      `mutation UpdateMemberPasswordHash($memberId: UUID!, $passwordHash: String!) {
        member_update(id: $memberId, data: { passwordHash: $passwordHash })
      }`,
      { memberId: member.id, passwordHash },
    );

    await executeMutation(
      `mutation ClearMemberPasswordResetToken($memberId: UUID!) {
        member_update(id: $memberId, data: {
          passwordResetToken: null passwordResetTokenExpiresAt: null passwordResetTokenUses: null
        })
      }`,
      { memberId: member.id },
    );

    return { success: true };
  },
);
