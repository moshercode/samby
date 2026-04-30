import { getEmailStrings } from './i18n';

interface BusinessBranding {
  name: string;
  shortName: string;
  primaryColor: string;
  secondaryColor: string;
}

export function buildResetPasswordEmail(
  clientName: string,
  token: string,
  business: BusinessBranding,
  locale: string,
): { subject: string; html: string } {
  const s = getEmailStrings(locale).resetPassword;

  return {
    subject: s.subject(business.name),
    html: `
      <div style="font-family:sans-serif;max-width:480px;margin:0 auto;padding:24px">
        <h2 style="color:${business.primaryColor};margin:0 0 24px">${business.name}</h2>
        <p>${s.greeting(clientName)}</p>
        <p>${s.body}</p>
        <p style="font-size:36px;font-weight:700;letter-spacing:8px;color:${business.primaryColor};margin:32px 0">
          ${token}
        </p>
        <p style="color:#888;font-size:13px">${s.expiry}</p>
        <p style="color:#888;font-size:13px">${s.ignore}</p>
        <hr style="border:none;border-top:1px solid ${business.secondaryColor};margin:24px 0">
        <p style="color:#aaa;font-size:11px;margin:0">${business.name}</p>
      </div>
    `,
  };
}
