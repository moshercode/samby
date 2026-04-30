import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import * as admin from 'firebase-admin';
import * as bcrypt from 'bcryptjs';
import { executeQuery } from './data_connect';

interface LoginRequest {
  email: string;
  password: string;
  businessId: string;
}

interface ClientForAuth {
  id: string;
  name: string;
  phone: string;
  email: string;
  isBlocked: boolean;
  passwordHash: string;
}

interface GetClientForAuthData {
  clients: ClientForAuth[];
}

export const clientLogin = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { email, password, businessId } = request.data as LoginRequest;

    if (!email || !password || !businessId) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
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

    // Same error for "not found" and "wrong password" to avoid user enumeration
    if (!client) {
      throw new HttpsError('unauthenticated', 'Invalid credentials');
    }

    const passwordMatch = await bcrypt.compare(password, client.passwordHash);
    if (!passwordMatch) {
      throw new HttpsError('unauthenticated', 'Invalid credentials');
    }

    const token = await admin.auth().createCustomToken(client.id, {
      clientId: client.id,
      businessId,
    });

    return { token, clientId: client.id };
  },
);
