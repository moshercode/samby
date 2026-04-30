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
  businessId: string;
  gdprConsentVersion: string;
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

export const clientRegister = onCall(
  { region: 'europe-southwest1', invoker: 'public' },
  async (request: CallableRequest) => {
    const { name, phone, email, password, businessId, gdprConsentVersion } =
      request.data as RegisterRequest;

    if (!name || !phone || !email || !password || !businessId || !gdprConsentVersion) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    const kGetClientForAuth = `query GetClientForAuth($businessId: UUID!, $email: String!) {
      clients(where: { businessId: { eq: $businessId }, email: { eq: $email } }, limit: 1) {
        id name phone email isBlocked passwordHash
        passwordResetToken passwordResetTokenExpiresAt passwordResetTokenUses
      }
    }`;

    const existing = await executeQuery<GetClientForAuthData>(kGetClientForAuth, { businessId, email });

    if (existing.clients.length > 0) {
      throw new HttpsError('already-exists', 'Client already registered for this business');
    }

    const passwordHash = await bcrypt.hash(password, BCRYPT_ROUNDS);

    await executeMutation(
      `mutation RegisterClientFromPWA(
        $businessId: UUID!, $name: String!, $phone: String!, $email: String!,
        $passwordHash: String!, $gdprConsentAt: Timestamp!, $gdprConsentVersion: String!
      ) {
        client_insert(data: {
          businessId: $businessId name: $name phone: $phone email: $email
          passwordHash: $passwordHash gdprConsentAt: $gdprConsentAt gdprConsentVersion: $gdprConsentVersion
        })
      }`,
      { businessId, name, phone, email, passwordHash, gdprConsentAt: new Date().toISOString(), gdprConsentVersion },
    );

    const created = await executeQuery<GetClientForAuthData>(kGetClientForAuth, { businessId, email });
    const clientId = created.clients[0].id;

    const token = await admin.auth().createCustomToken(clientId, { clientId, businessId });
    return { token, clientId };
  },
);
