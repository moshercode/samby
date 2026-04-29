import 'package:samby/presentation/resources/l10n/localization.dart';

class L10nDe extends Localization {
  // General

  @override
  String get loading => 'Wird geladen…';
  @override
  String get errorGeneric => 'Etwas ist schiefgelaufen. Bitte erneut versuchen';
  @override
  String get errorNetwork => 'Keine Verbindung. Netzwerk prüfen';
  @override
  String get cancel => 'Abbrechen';
  @override
  String get confirm => 'Bestätigen';
  @override
  String get continueLabel => 'Weiter';
  @override
  String get save => 'Speichern';
  @override
  String get delete => 'Löschen';
  @override
  String get edit => 'Bearbeiten';

  // Splash

  @override
  String get splashAssociationNotFound => 'Verein nicht gefunden';
  @override
  String get splashAssociationNotFoundSubtitle => 'Der verwendete Link entspricht keinem bei Samby registrierten Verein';

  // Auth

  @override
  String get authLoginTitle => 'Willkommen zurück';
  @override
  String get authLoginSubtitle => 'Melde dich an, um auf deinen Verein zuzugreifen';
  @override
  String get authRegisterTitle => 'Konto erstellen';
  @override
  String get authRegisterSubtitle => 'Registriere dich, um Zugang zu beantragen';
  @override
  String get authFullName => 'Vollständiger Name';
  @override
  String get authEmail => 'E-Mail';
  @override
  String get authPassword => 'Passwort';
  @override
  String get authLoginSubmit => 'Anmelden';
  @override
  String get authRegisterSubmit => 'Konto erstellen';
  @override
  String get authSwitchToLogin => 'Bereits ein Konto? Anmelden';
  @override
  String get authSwitchToRegister => 'Kein Konto? Registrieren';
  @override
  String get authForgotPassword => 'Passwort vergessen?';
  @override
  String get authErrorInvalidData => 'Bitte alle Felder korrekt ausfüllen';
  @override
  String get authErrorInvalidCredentials => 'E-Mail oder Passwort falsch';
  @override
  String get authErrorEmailInUse => 'Diese E-Mail wird bereits verwendet';
  @override
  String get authErrorWeakPassword => 'Das Passwort muss mindestens 6 Zeichen haben';
  @override
  String get authErrorTooManyAttempts => 'Zu viele Versuche. Bitte warten';
  @override
  String get passwordResetTitle => 'Passwort zurücksetzen';
  @override
  String get passwordResetSubtitle => 'Wir senden einen Wiederherstellungslink an deine E-Mail';
  @override
  String get passwordResetSend => 'Link senden';
  @override
  String get passwordResetSentConfirmation => 'E-Mail überprüfen';
  @override
  String get passwordResetBack => 'Zurück zur Anmeldung';

  // Onboarding

  @override
  String get onboardingTitle => 'Verein erstellen';
  @override
  String get onboardingSubtitle => 'Grundlegende Daten deines Vereins einrichten';
  @override
  String get onboardingBlock1Title => 'Vereinsinformationen';
  @override
  String get onboardingAssociationName => 'Vollständiger Name';
  @override
  String get onboardingAssociationShortName => 'Kurzname';
  @override
  String get onboardingAssociationShortNameHint => 'z.B. Die Comparsa';
  @override
  String get onboardingAssociationSubdomain => 'Webadresse';
  @override
  String get onboardingAssociationSubdomainHint => 'z.B. lacomparsa';
  @override
  String get onboardingPrimaryColor => 'Primärfarbe';
  @override
  String get onboardingSecondaryColor => 'Sekundärfarbe';
  @override
  String get onboardingBlock2Title => 'Allgemeine Bedingungen';
  @override
  String get onboardingBlock3Title => 'Bedingungen für Minderjährige';
  @override
  String get onboardingAddCondition => 'Bedingung hinzufügen';
  @override
  String get onboardingConditionHint => 'Bedingung eingeben…';
  @override
  String get onboardingSubmit => 'Verein erstellen';
  @override
  String get onboardingSubdomainTaken => 'Diese Adresse ist bereits vergeben';
  @override
  String get onboardingSubdomainInvalid => 'Nur Kleinbuchstaben, Zahlen und Bindestriche';

  // Access request

  @override
  String get accessRequestTitle => 'Zugang beantragen';
  @override
  String get accessRequestSubtitle => 'Formular ausfüllen, um deinen Antrag einzureichen';
  @override
  String get accessRequestBlock1Title => 'Persönliche Daten';
  @override
  String get accessRequestFullName => 'Vollständiger Name';
  @override
  String get accessRequestBirthDate => 'Geburtsdatum';
  @override
  String get accessRequestBirthDateHint => 'TT.MM.JJJJ';
  @override
  String get accessRequestDNI => 'Ausweis / Reisepass';
  @override
  String get accessRequestUploadDNI => 'Ausweisfoto hochladen';
  @override
  String get accessRequestDNIUploaded => 'Ausweis erfolgreich hochgeladen';
  @override
  String get accessRequestMinorWarning => 'Du bist minderjährig. Wir benötigen die Daten deines Erziehungsberechtigten';
  @override
  String get accessRequestGuardianTitle => 'Daten des Erziehungsberechtigten';
  @override
  String get accessRequestGuardianFullName => 'Vollständiger Name des Erziehungsberechtigten';
  @override
  String get accessRequestGuardianDNI => 'Ausweis des Erziehungsberechtigten';
  @override
  String get accessRequestUploadGuardianDNI => 'Ausweis des Erziehungsberechtigten hochladen';
  @override
  String get accessRequestBlock2Title => 'Bedingungen';
  @override
  String get accessRequestBlock3Title => 'Unterschrift';
  @override
  String get accessRequestSignatureHint => 'Unterschrift im Feld zeichnen';
  @override
  String get accessRequestClearSignature => 'Unterschrift löschen';
  @override
  String get accessRequestSubmit => 'Antrag einreichen';
  @override
  String get accessRequestSubmitting => 'Antrag wird gesendet…';

  // Pending approval

  @override
  String get pendingTitle => 'Antrag eingereicht';
  @override
  String get pendingSubtitle => 'Dein Antrag wird geprüft';
  @override
  String get pendingMessage => 'Ein Manager des Vereins wird deinen Antrag prüfen und du erhältst eine Benachrichtigung, wenn er angenommen wird';

  // Rejected

  @override
  String get rejectedTitle => 'Antrag abgelehnt';
  @override
  String get rejectedSubtitle => 'Dein Antrag wurde nicht angenommen';
  @override
  String get rejectedMessage => 'Wenn du glaubst, dass dies ein Fehler ist, kannst du einen neuen Antrag stellen';
  @override
  String get rejectedReapply => 'Erneut beantragen';
  @override
  String get rejectedBlocked => 'Du kannst keinen Zugang zu diesem Verein mehr beantragen';

  // Dashboard

  @override
  String get dashboardTitle => 'Startseite';
}
