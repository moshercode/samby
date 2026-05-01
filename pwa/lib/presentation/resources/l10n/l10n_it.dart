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
  @override
  String get fieldTitle => 'Titolo';
  @override
  String get fieldDescription => 'Descrizione';
  @override
  String get clearDate => 'Cancella data';
  @override
  String get selectAll => 'Tutti';
  @override
  String get selectNone => 'Nessuno';

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
  String get authPhone => 'Telefono';
  @override
  String get authResetCode => 'Codice di verifica';
  @override
  String get authNewPassword => 'Nuova password';
  @override
  String get authResetSubmit => 'Cambia password';
  @override
  String get authErrorResetTokenInvalid => 'Codice non valido';
  @override
  String get authErrorResetTokenExpired => 'Il codice è scaduto';
  @override
  String get authErrorResetTokenUsed => 'Il codice è già stato utilizzato';
  @override
  String get passwordResetTitle => 'Reimposta password';
  @override
  String get passwordResetSubtitle => "Invieremo un codice di verifica alla tua email";
  @override
  String get passwordResetSend => 'Invia codice';
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
  String get accessRequestIdDoc => "Carta d'identità / Passaporto";
  @override
  String get accessRequestUploadIdDoc => "Carica foto del documento";
  @override
  String get accessRequestIdDocUploaded => 'Documento caricato con successo';
  @override
  String get accessRequestMinorWarning => "Sei minorenne. Abbiamo bisogno dei dati del tuo tutore legale";
  @override
  String get accessRequestGuardianTitle => 'Dati del tutore legale';
  @override
  String get accessRequestGuardianFullName => 'Nome completo del tutore';
  @override
  String get accessRequestGuardianIdDoc => 'Documento del tutore';
  @override
  String get accessRequestUploadGuardianIdDoc => 'Carica documento del tutore';
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
  @override
  String get dashboardActiveEvents => 'Eventi';
  @override
  String get dashboardNoEvents => 'Nessun evento attivo';
  @override
  String get eventDetailSessions => 'Sessioni';
  @override
  String get eventDetailNoSessions => 'Nessuna sessione in programma';
  @override
  String get eventDetailMembers => 'Accesso';
  @override
  String get createEventTitle => 'Nuovo evento';
  @override
  String get createEventStartDate => 'Data di inizio';
  @override
  String get createEventEndDate => 'Data di fine (facoltativo)';
  @override
  String get createEventImageLabel => "Immagine dell'evento";
  @override
  String get createEventMembersLabel => 'Soci con accesso';
  @override
  String get createEventSubmit => "Crea evento";
  @override
  String get createCalendarEventTitle => 'Nuova sessione';
  @override
  String get createCalendarEventDateLabel => 'Data della sessione';
  @override
  String get createCalendarEventSubmit => 'Crea sessione';

  // Home

  @override
  String get homeTabEvents => 'Eventi';
  @override
  String get homeTabMembers => 'Soci';
  @override
  String get homeTabAssociation => 'Associazione';
  @override
  String get homeTabProfile => 'Profilo';

  // Membership status

  @override
  String get membershipStatusPendingTitle => 'Richiesta inviata';
  @override
  String get membershipStatusPendingMessage => "Un manager esaminerà la tua richiesta e riceverai una notifica quando sarà accettata";
  @override
  String get membershipStatusRejectedTitle => 'Richiesta rifiutata';
  @override
  String get membershipStatusRejectedMessage => "La tua richiesta non è stata accettata. Puoi inviare una nuova richiesta";
  @override
  String get membershipStatusBlockedMessage => "Non puoi più richiedere l'accesso a questa associazione";
  @override
  String get membershipStatusReapply => 'Richiedi di nuovo';
  @override
  String get membershipStatusRefresh => 'Aggiorna stato';

  // Events extras

  @override
  String get eventsActive => 'Attivi';
  @override
  String get eventsFinished => 'Terminati';
  @override
  String get eventsEmpty => 'Nessun evento';
  @override
  String get eventDetailFreeEntry => 'Ingresso libero';
  @override
  String get eventDetailRequestAccess => "Richiedi accesso";
  @override
  String get eventDetailAccessPending => 'Richiesta in attesa';
  @override
  String get eventDetailAccessRejected => 'Accesso negato';
  @override
  String get createEventFreeEntry => 'Ingresso libero';
  @override
  String get createEventEntryCondition => "Condizione d'ingresso";
  @override
  String get createAppointmentTitle => 'Nuova sessione';
  @override
  String get createAppointmentDateLabel => 'Data della sessione';
  @override
  String get createAppointmentSubmit => 'Crea sessione';

  // Association Detail

  @override
  String get associationDetailTitle => 'Associazione';
  @override
  String get associationDetailRequirements => 'Requisiti di candidatura';
  @override
  String get associationDetailRequireIdDoc => "Richiedere documento d'identità";
  @override
  String get associationDetailRequireIdDocImage => "Richiedere immagine del documento";
  @override
  String get associationDetailRequireGuardian => "Richiedere dati del tutore";

  // Profile

  @override
  String get profileTitle => 'Profilo';
  @override
  String get profileLogout => 'Disconnettersi';
  @override
  String get profileMemberSince => 'Socio da';

  // Onboarding extras

  @override
  String get onboardingRequireIdDoc => "Richiedere documento d'identità";
  @override
  String get onboardingRequireIdDocImage => "Richiedere immagine del documento";
  @override
  String get onboardingRequireGuardian => "Richiedere dati del tutore per i minori";

  // Members

  @override
  String get membersTitle => 'Soci';
  @override
  String get membersEmpty => 'Ancora nessun socio';
  @override
  String get memberStatusPending => 'In attesa';
  @override
  String get memberStatusApproved => 'Approvato';
  @override
  String get memberStatusRejected => 'Rifiutato';
  @override
  String get memberRoleManager => 'Manager';
  @override
  String get memberRoleMember => 'Socio';
  @override
  String get memberBlocked => 'Bloccato';

  // Member detail

  @override
  String get memberDetailPersonalInfo => 'Informazioni personali';
  @override
  String get memberDetailEvents => 'Eventi';
  @override
  String get memberDetailNoEvents => 'Nessun evento assegnato';
  @override
  String get memberDetailChangeRole => 'Ruolo';
}
