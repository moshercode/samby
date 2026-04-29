import 'package:samby/presentation/resources/l10n/localization.dart';

class L10nIt extends Localization {
  // General

  @override
  String get loading => 'Caricamento…';
  @override
  String get errorGeneric => "Si è verificato un errore. Riprova";
  @override
  String get errorNetwork => 'Nessuna connessione. Controlla la rete';
  @override
  String get cancel => 'Annulla';
  @override
  String get confirm => 'Conferma';
  @override
  String get continueLabel => 'Continua';
  @override
  String get save => 'Salva';
  @override
  String get delete => 'Elimina';
  @override
  String get edit => 'Modifica';

  // Splash

  @override
  String get splashAssociationNotFound => 'Associazione non trovata';
  @override
  String get splashAssociationNotFoundSubtitle => "Il link utilizzato non corrisponde ad alcuna associazione registrata su Samby";

  // Auth

  @override
  String get authLoginTitle => 'Bentornato';
  @override
  String get authLoginSubtitle => "Accedi per entrare nella tua associazione";
  @override
  String get authRegisterTitle => 'Crea account';
  @override
  String get authRegisterSubtitle => "Registrati per richiedere l'accesso";
  @override
  String get authFullName => 'Nome completo';
  @override
  String get authEmail => 'Email';
  @override
  String get authPassword => 'Password';
  @override
  String get authLoginSubmit => 'Accedi';
  @override
  String get authRegisterSubmit => 'Crea account';
  @override
  String get authSwitchToLogin => 'Hai già un account? Accedi';
  @override
  String get authSwitchToRegister => "Non hai un account? Registrati";
  @override
  String get authForgotPassword => 'Password dimenticata?';
  @override
  String get authErrorInvalidData => 'Compila tutti i campi correttamente';
  @override
  String get authErrorInvalidCredentials => 'Email o password errati';
  @override
  String get authErrorEmailInUse => 'Questa email è già in uso';
  @override
  String get authErrorWeakPassword => 'La password deve avere almeno 6 caratteri';
  @override
  String get authErrorTooManyAttempts => 'Troppi tentativi. Attendi un momento';
  @override
  String get passwordResetTitle => 'Reimposta password';
  @override
  String get passwordResetSubtitle => "Invieremo un link di recupero alla tua email";
  @override
  String get passwordResetSend => 'Invia link';
  @override
  String get passwordResetSentConfirmation => 'Controlla la tua email';
  @override
  String get passwordResetBack => 'Torna al login';

  // Onboarding

  @override
  String get onboardingTitle => 'Crea la tua associazione';
  @override
  String get onboardingSubtitle => "Configura le informazioni di base della tua associazione";
  @override
  String get onboardingBlock1Title => "Informazioni sull'associazione";
  @override
  String get onboardingAssociationName => 'Nome completo';
  @override
  String get onboardingAssociationShortName => 'Nome breve';
  @override
  String get onboardingAssociationShortNameHint => 'Es: La Comparsa';
  @override
  String get onboardingAssociationSubdomain => 'Indirizzo web';
  @override
  String get onboardingAssociationSubdomainHint => 'Es: lacomparsa';
  @override
  String get onboardingPrimaryColor => 'Colore primario';
  @override
  String get onboardingSecondaryColor => 'Colore secondario';
  @override
  String get onboardingBlock2Title => 'Condizioni generali';
  @override
  String get onboardingBlock3Title => 'Condizioni per i minori';
  @override
  String get onboardingAddCondition => 'Aggiungi condizione';
  @override
  String get onboardingConditionHint => 'Scrivi la condizione…';
  @override
  String get onboardingSubmit => "Crea l'associazione";
  @override
  String get onboardingSubdomainTaken => 'Questo indirizzo è già in uso';
  @override
  String get onboardingSubdomainInvalid => 'Solo lettere minuscole, numeri e trattini';

  // Access request

  @override
  String get accessRequestTitle => "Richiedi l'accesso";
  @override
  String get accessRequestSubtitle => 'Compila il modulo per inviare la tua richiesta';
  @override
  String get accessRequestBlock1Title => 'Dati personali';
  @override
  String get accessRequestFullName => 'Nome completo';
  @override
  String get accessRequestBirthDate => 'Data di nascita';
  @override
  String get accessRequestBirthDateHint => 'GG/MM/AAAA';
  @override
  String get accessRequestDNI => 'Carta d\'identità / Passaporto';
  @override
  String get accessRequestUploadDNI => "Carica foto del documento";
  @override
  String get accessRequestDNIUploaded => 'Documento caricato con successo';
  @override
  String get accessRequestMinorWarning => "Sei minorenne. Abbiamo bisogno dei dati del tuo tutore legale";
  @override
  String get accessRequestGuardianTitle => 'Dati del tutore legale';
  @override
  String get accessRequestGuardianFullName => 'Nome completo del tutore';
  @override
  String get accessRequestGuardianDNI => 'Documento del tutore';
  @override
  String get accessRequestUploadGuardianDNI => 'Carica documento del tutore';
  @override
  String get accessRequestBlock2Title => 'Condizioni';
  @override
  String get accessRequestBlock3Title => 'Firma';
  @override
  String get accessRequestSignatureHint => 'Disegna la tua firma nel riquadro';
  @override
  String get accessRequestClearSignature => 'Cancella firma';
  @override
  String get accessRequestSubmit => 'Invia richiesta';
  @override
  String get accessRequestSubmitting => 'Invio in corso…';

  // Pending approval

  @override
  String get pendingTitle => 'Richiesta inviata';
  @override
  String get pendingSubtitle => 'La tua richiesta è in fase di revisione';
  @override
  String get pendingMessage => "Un manager dell'associazione esaminerà la tua richiesta e riceverai una notifica quando sarà accettata";

  // Rejected

  @override
  String get rejectedTitle => 'Richiesta rifiutata';
  @override
  String get rejectedSubtitle => 'La tua richiesta non è stata accettata';
  @override
  String get rejectedMessage => 'Se pensi che sia un errore, puoi inviare una nuova richiesta';
  @override
  String get rejectedReapply => 'Richiedi di nuovo';
  @override
  String get rejectedBlocked => "Non puoi più richiedere l'accesso a questa associazione";

  // Dashboard

  @override
  String get dashboardTitle => 'Home';
}
