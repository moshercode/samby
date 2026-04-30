import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import * as bcrypt from 'bcryptjs';
import { executeQuery, executeMutation } from './data_connect';

const BCRYPT_ROUNDS = 12;
const MAX_RESET_USES = 5;

interface ResetPasswordRequest {
  email: string;
  businessId: string;
  token: string;
  newPassword: string;
}

interface ClientForAuth {
  id: string;
  passwordResetToken: string | null;
  passwordResetTokenExpiresAt: string | null;
  passwordResetTokenUses: number | null;
}

interface GetClientForAuthData {
  clients: ClientForAuth[];
}

export const clientResetPassword = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { email, businessId, token, newPassword } = request.data as ResetPasswordRequest;

    if (!email || !businessId || !token || !newPassword) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    if (newPassword.length < 8) {
      throw new HttpsError('invalid-argument', 'Password must be at least 8 characters');
    }

    const result = await executeQuery<GetClientForAuthData>(
      `query GetClientForAuth($businessId: UUID!, $email: String!) {
        clients(where: { businessId: { eq: $businessId }, email: { eq: $email } }, limit: 1) {
          id name phone email isBlocked passwordHash
          passwordResetToken passwordResetTokenExpiresAt passwordResetTokenUses
        }
      }`,
      { businessId, email },
    );

    const client = result.clients[0];

    if (!client || !client.passwordResetToken) {
      throw new HttpsError('not-found', 'No active reset token');
    }

    const uses = client.passwordResetTokenUses ?? 0;

    if (uses >= MAX_RESET_USES) {
      throw new HttpsError('resource-exhausted', 'Too many attempts');
    }

    if (client.passwordResetToken !== token) {
      await executeMutation(
        `mutation UpdateClientPasswordResetUses($clientId: UUID!, $uses: Int!) {
          client_update(id: $clientId, data: { passwordResetTokenUses: $uses })
        }`,
        { clientId: client.id, uses: uses + 1 },
      );
      throw new HttpsError('unauthenticated', 'Invalid token');
    }

    if (!client.passwordResetTokenExpiresAt || new Date(client.passwordResetTokenExpiresAt) < new Date()) {
      throw new HttpsError('deadline-exceeded', 'Token expired');
    }

    const passwordHash = await bcrypt.hash(newPassword, BCRYPT_ROUNDS);

    await executeMutation(
      `mutation UpdateClientPasswordHash($clientId: UUID!, $passwordHash: String!) {
        client_update(id: $clientId, data: { passwordHash: $passwordHash })
      }`,
      { clientId: client.id, passwordHash },
    );

    await executeMutation(
      `mutation ClearClientPasswordResetToken($clientId: UUID!) {
        client_update(id: $clientId, data: {
          passwordResetToken: null passwordResetTokenExpiresAt: null passwordResetTokenUses: null
        })
      }`,
      { clientId: client.id },
    );

    return { success: true };
  },
);
