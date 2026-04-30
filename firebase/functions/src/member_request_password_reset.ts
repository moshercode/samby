import { onCall, HttpsError, CallableRequest } from 'firebase-functions/v2/https';
import { Resend } from 'resend';
import * as crypto from 'crypto';
import { executeQuery, executeMutation } from './data_connect';
import { buildResetPasswordEmail } from './email/reset_password_template';

const TOKEN_EXPIRY_MS = 15 * 60 * 1000;

interface RequestResetRequest {
  email: string;
  associationId: string;
  locale: string;
}

interface MemberForAuth {
  id: string;
  name: string;
  email: string;
}

interface GetMemberForAuthData {
  members: MemberForAuth[];
}

interface AssociationBranding {
  id: string;
  name: string;
  shortName: string;
  subdomain: string;
  primaryColor: string;
  secondaryColor: string;
}

interface GetAssociationBrandingData {
  association: AssociationBranding;
}

export const memberRequestPasswordReset = onCall(
  { region: 'europe-southwest1', secrets: ['RESEND_API_KEY'], invoker: 'public' },
  async (request: CallableRequest) => {
    const { email, associationId, locale } = request.data as RequestResetRequest;

    if (!email || !associationId) {
      throw new HttpsError('invalid-argument', 'Missing required fields');
    }

    const result = await executeQuery<GetMemberForAuthData>(
      `query GetMemberForAuth($associationId: UUID!, $email: String!) {
        members(where: { associationId: { eq: $associationId }, email: { eq: $email } }, limit: 1) {
          id name email
        }
      }`,
      { associationId, email },
    );

    if (result.members.length === 0) {
      return { sent: true };
    }

    const member = result.members[0];

    const brandingResult = await executeQuery<GetAssociationBrandingData>(
      `query GetAssociationBranding($id: UUID!) {
        association(id: $id) { id name shortName subdomain primaryColor secondaryColor }
      }`,
      { id: associationId },
    );
    const association = brandingResult.association;

    const token = crypto.randomInt(100000, 999999).toString();
    const expiresAt = new Date(Date.now() + TOKEN_EXPIRY_MS).toISOString();

    await executeMutation(
      `mutation SetMemberPasswordResetToken($memberId: UUID!, $token: String!, $expiresAt: Timestamp!) {
        member_update(id: $memberId, data: {
          passwordResetToken: $token passwordResetTokenExpiresAt: $expiresAt passwordResetTokenUses: 0
        })
      }`,
      { memberId: member.id, token, expiresAt },
    );

    const { subject, html } = buildResetPasswordEmail(member.name, token, association, locale ?? 'en');

    const resend = new Resend(process.env.RESEND_API_KEY);
    await resend.emails.send({
      from: `${association.shortName} <${association.subdomain}@samby.app>`,
      to: email,
      subject,
      html,
    });

    return { sent: true };
  },
);
