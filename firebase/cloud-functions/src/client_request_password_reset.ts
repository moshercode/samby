import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import { Resend } from 'resend';
import * as crypto from 'crypto';
import { executeQuery, executeMutation } from './data_connect';
import { buildResetPasswordEmail } from './email/reset_password_template';

const TOKEN_EXPIRY_MS = 15 * 60 * 1000;

interface RequestResetRequest {
  email: string;
  businessId: string;
  locale: string;
}

interface ClientForAuth {
  id: string;
  name: string;
  email: string;
}

interface GetClientForAuthData {
  clients: ClientForAuth[];
}

interface BusinessBranding {
  id: string;
  name: string;
  shortName: string;
  subdomain: string;
  primaryColor: string;
  secondaryColor: string;
}

interface GetBusinessBrandingData {
  business: BusinessBranding;
}

export const clientRequestPasswordReset = onCall(
  { region: 'europe-southwest1', secrets: ['RESEND_API_KEY'], invoker: 'public' },
  async (request: CallableRequest) => {
    const { email, businessId, locale } = request.data as RequestResetRequest;

    if (!email || !businessId) {
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

    // Respuesta genérica para no revelar si el email existe
    if (result.clients.length === 0) {
      console.log(`[passwordReset] No client found for email=${email} businessId=${businessId}`);
      return { sent: true };
    }

    const client = result.clients[0];
    console.log(`[passwordReset] Client found: id=${client.id}`);

    const brandingResult = await executeQuery<GetBusinessBrandingData>(
      `query GetBusinessBranding($id: UUID!) {
        business(id: $id) { id name shortName subdomain primaryColor secondaryColor }
      }`,
      { id: businessId },
    );
    const business = brandingResult.business;

    const token = crypto.randomInt(100000, 999999).toString();
    const expiresAt = new Date(Date.now() + TOKEN_EXPIRY_MS).toISOString();

    await executeMutation(
      `mutation SetClientPasswordResetToken($clientId: UUID!, $token: String!, $expiresAt: Timestamp!) {
        client_update(id: $clientId, data: {
          passwordResetToken: $token passwordResetTokenExpiresAt: $expiresAt passwordResetTokenUses: 0
        })
      }`,
      { clientId: client.id, token, expiresAt },
    );

    const { subject, html } = buildResetPasswordEmail(client.name, token, business, locale ?? 'en');

    const resend = new Resend(process.env.RESEND_API_KEY);
    const sendResult = await resend.emails.send({
      from: `${business.shortName} <${business.subdomain}@biuti.app>`,
      to: email,
      subject,
      html,
    });
    console.log(`[passwordReset] Resend result:`, JSON.stringify(sendResult));

    return { sent: true };
  },
);
