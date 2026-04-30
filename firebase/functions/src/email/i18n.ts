export interface ResetPasswordStrings {
  subject: (associationName: string) => string;
  greeting: (memberName: string) => string;
  body: string;
  expiry: string;
  ignore: string;
}

export interface EmailStrings {
  resetPassword: ResetPasswordStrings;
}

type Locale = 'es' | 'en' | 'fr' | 'de' | 'pt' | 'it' | 'ca';

const strings: Record<Locale, EmailStrings> = {
  es: {
    resetPassword: {
      subject: (b) => `Código de verificación — ${b}`,
      greeting: (n) => `Hola ${n},`,
      body: 'Tu código para restablecer la contraseña es:',
      expiry: 'Este código expira en <strong>15 minutos</strong> y solo puede usarse una vez.',
      ignore: 'Si no solicitaste este cambio, ignora este mensaje.',
    },
  },
  en: {
    resetPassword: {
      subject: (b) => `Verification code — ${b}`,
      greeting: (n) => `Hi ${n},`,
      body: 'Your password reset code is:',
      expiry: 'This code expires in <strong>15 minutes</strong> and can only be used once.',
      ignore: 'If you did not request this change, please ignore this message.',
    },
  },
  fr: {
    resetPassword: {
      subject: (b) => `Code de vérification — ${b}`,
      greeting: (n) => `Bonjour ${n},`,
      body: 'Votre code pour réinitialiser votre mot de passe est :',
      expiry: "Ce code expire dans <strong>15 minutes</strong> et ne peut être utilisé qu'une seule fois.",
      ignore: "Si vous n'avez pas demandé ce changement, ignorez ce message.",
    },
  },
  de: {
    resetPassword: {
      subject: (b) => `Verifizierungscode — ${b}`,
      greeting: (n) => `Hallo ${n},`,
      body: 'Ihr Code zum Zurücksetzen des Passworts lautet:',
      expiry: 'Dieser Code läuft in <strong>15 Minuten</strong> ab und kann nur einmal verwendet werden.',
      ignore: 'Wenn Sie diese Änderung nicht angefordert haben, ignorieren Sie diese Nachricht.',
    },
  },
  pt: {
    resetPassword: {
      subject: (b) => `Código de verificação — ${b}`,
      greeting: (n) => `Olá ${n},`,
      body: 'O seu código para redefinir a palavra-passe é:',
      expiry: 'Este código expira em <strong>15 minutos</strong> e só pode ser usado uma vez.',
      ignore: 'Se não solicitou esta alteração, ignore esta mensagem.',
    },
  },
  it: {
    resetPassword: {
      subject: (b) => `Codice di verifica — ${b}`,
      greeting: (n) => `Ciao ${n},`,
      body: 'Il tuo codice per reimpostare la password è:',
      expiry: 'Questo codice scade in <strong>15 minuti</strong> e può essere utilizzato una sola volta.',
      ignore: 'Se non hai richiesto questa modifica, ignora questo messaggio.',
    },
  },
  ca: {
    resetPassword: {
      subject: (b) => `Codi de verificació — ${b}`,
      greeting: (n) => `Hola ${n},`,
      body: 'El teu codi per restablir la contrasenya és:',
      expiry: 'Aquest codi caduca en <strong>15 minuts</strong> i només es pot utilitzar una vegada.',
      ignore: 'Si no has sol·licitat aquest canvi, ignora aquest missatge.',
    },
  },
};

const FALLBACK_LOCALE: Locale = 'en';

export function getEmailStrings(locale: string): EmailStrings {
  return strings[(locale as Locale) in strings ? (locale as Locale) : FALLBACK_LOCALE];
}
