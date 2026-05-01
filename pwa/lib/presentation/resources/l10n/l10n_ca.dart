import 'package:samby/presentation/resources/l10n/localization.dart';

class L10nCa extends Localization {
  // General

  @override
  String get loading => 'Carregant…';
  @override
  String get errorGeneric => "Alguna cosa ha anat malament. Torna-ho a intentar";
  @override
  String get errorNetwork => "Sense connexió. Comprova la xarxa";
  @override
  String get cancel => 'Cancel·la';
  @override
  String get confirm => 'Confirma';
  @override
  String get continueLabel => 'Continua';
  @override
  String get save => 'Desa';
  @override
  String get delete => 'Elimina';
  @override
  String get edit => 'Edita';
  @override
  String get fieldTitle => 'Títol';
  @override
  String get fieldDescription => 'Descripció';
  @override
  String get clearDate => 'Eliminar data';
  @override
  String get selectAll => 'Tots';
  @override
  String get selectNone => 'Cap';

  // Splash

  @override
  String get splashBandNotFound => 'Associació no trobada';
  @override
  String get splashBandNotFoundSubtitle => "L'enllaç que has utilitzat no correspon a cap associació registrada a Samby";

  // Auth

  @override
  String get authLoginTitle => 'Benvingut de nou';
  @override
  String get authLoginSubtitle => "Inicia sessió per accedir a la teva associació";
  @override
  String get authRegisterTitle => 'Crea un compte';
  @override
  String get authRegisterSubtitle => "Registra't per sol·licitar l'accés";
  @override
  String get authFullName => 'Nom complet';
  @override
  String get authEmail => 'Correu electrònic';
  @override
  String get authPassword => 'Contrasenya';
  @override
  String get authLoginSubmit => 'Inicia sessió';
  @override
  String get authRegisterSubmit => 'Crea un compte';
  @override
  String get authSwitchToLogin => 'Ja tens compte? Inicia sessió';
  @override
  String get authSwitchToRegister => "No tens compte? Registra't";
  @override
  String get authForgotPassword => 'Has oblidat la contrasenya?';
  @override
  String get authErrorInvalidData => 'Si us plau, omple tots els camps correctament';
  @override
  String get authErrorInvalidCredentials => 'Correu electrònic o contrasenya incorrectes';
  @override
  String get authErrorEmailInUse => 'Aquest correu ja està en ús';
  @override
  String get authErrorWeakPassword => "La contrasenya ha de tenir almenys 6 caràcters";
  @override
  String get authErrorTooManyAttempts => "Massa intents. Espera un moment";
  @override
  String get authPhone => 'Telèfon';
  @override
  String get authResetCode => 'Codi de verificació';
  @override
  String get authNewPassword => 'Nova contrasenya';
  @override
  String get authResetSubmit => 'Canvia la contrasenya';
  @override
  String get authErrorResetTokenInvalid => 'Codi no vàlid';
  @override
  String get authErrorResetTokenExpired => 'El codi ha caducat';
  @override
  String get authErrorResetTokenUsed => "El codi ja ha estat utilitzat";
  @override
  String get passwordResetTitle => 'Recupera la contrasenya';
  @override
  String get passwordResetSubtitle => "T'enviarem un codi de verificació al correu";
  @override
  String get passwordResetSend => 'Envia el codi';
  @override
  String get passwordResetSentConfirmation => 'Comprova el teu correu';
  @override
  String get passwordResetBack => "Torna a l'inici de sessió";

  // Onboarding

  @override
  String get onboardingTitle => "Crea la teva associació";
  @override
  String get onboardingSubtitle => "Configura les dades bàsiques de la teva associació";
  @override
  String get onboardingBlock1Title => "Informació de l'associació";
  @override
  String get onboardingBandName => 'Nom complet';
  @override
  String get onboardingBandShortName => 'Nom curt';
  @override
  String get onboardingBandShortNameHint => 'Ex: La Comparsa';
  @override
  String get onboardingBandSubdomain => 'Adreça web';
  @override
  String get onboardingBandSubdomainHint => 'Ex: lacomparsa';
  @override
  String get onboardingPrimaryColor => 'Color primari';
  @override
  String get onboardingSecondaryColor => 'Color secundari';
  @override
  String get onboardingBlock2Title => 'Condicions generals';
  @override
  String get onboardingBlock3Title => 'Condicions per a menors';
  @override
  String get onboardingAddCondition => 'Afegeix una condició';
  @override
  String get onboardingConditionHint => 'Escriu la condició…';
  @override
  String get onboardingSubmit => "Crea l'associació";
  @override
  String get onboardingSubdomainTaken => "Aquesta adreça ja està en ús";
  @override
  String get onboardingSubdomainInvalid => 'Només lletres minúscules, números i guions';

  // Access request

  @override
  String get accessRequestTitle => "Sol·licita l'accés";
  @override
  String get accessRequestSubtitle => 'Omple el formulari per enviar la teva sol·licitud';
  @override
  String get accessRequestBlock1Title => 'Dades personals';
  @override
  String get accessRequestFullName => 'Nom complet';
  @override
  String get accessRequestBirthDate => 'Data de naixement';
  @override
  String get accessRequestBirthDateHint => 'DD/MM/AAAA';
  @override
  String get accessRequestIdDoc => 'DNI / NIE';
  @override
  String get accessRequestUploadIdDoc => 'Puja la foto del DNI';
  @override
  String get accessRequestIdDocUploaded => 'DNI pujat correctament';
  @override
  String get accessRequestMinorWarning => "Ets menor d'edat. Necessitem les dades del teu tutor legal";
  @override
  String get accessRequestGuardianTitle => 'Dades del tutor legal';
  @override
  String get accessRequestGuardianFullName => 'Nom complet del tutor';
  @override
  String get accessRequestGuardianIdDoc => 'DNI del tutor';
  @override
  String get accessRequestUploadGuardianIdDoc => 'Puja la foto del DNI del tutor';
  @override
  String get accessRequestBlock2Title => 'Condicions';
  @override
  String get accessRequestBlock3Title => 'Signatura';
  @override
  String get accessRequestSignatureHint => 'Dibuixa la teva signatura al requadre';
  @override
  String get accessRequestClearSignature => 'Esborra la signatura';
  @override
  String get accessRequestSubmit => 'Envia la sol·licitud';
  @override
  String get accessRequestSubmitting => 'Enviant la sol·licitud…';

  // Pending approval

  @override
  String get pendingTitle => "Sol·licitud enviada";
  @override
  String get pendingSubtitle => 'La teva sol·licitud està sent revisada';
  @override
  String get pendingMessage => "Un gestor de l'associació revisarà la teva sol·licitud i rebràs una notificació quan sigui acceptada";

  // Rejected

  @override
  String get rejectedTitle => 'Sol·licitud rebutjada';
  @override
  String get rejectedSubtitle => 'La teva sol·licitud no ha estat acceptada';
  @override
  String get rejectedMessage => "Si creus que és un error, pots tornar a enviar una sol·licitud";
  @override
  String get rejectedReapply => 'Tornar a sol·licitar';
  @override
  String get rejectedBlocked => "No pots tornar a sol·licitar l'accés a aquesta associació";

  // Dashboard

  @override
  String get dashboardTitle => 'Inici';
  @override
  String get dashboardActiveEvents => 'Esdeveniments';
  @override
  String get dashboardNoEvents => "No hi ha esdeveniments actius";
  @override
  String get eventDetailSessions => 'Sessions';
  @override
  String get eventDetailNoSessions => 'No hi ha sessions pròximes';
  @override
  String get eventDetailMembers => 'Accés';
  @override
  String get createEventTitle => 'Nou esdeveniment';
  @override
  String get createEventStartDate => "Data d'inici";
  @override
  String get createEventEndDate => 'Data de fi (opcional)';
  @override
  String get createEventImageLabel => "Imatge de l'esdeveniment";
  @override
  String get createEventMembersLabel => 'Membres amb accés';
  @override
  String get createEventSubmit => "Crear esdeveniment";
  @override
  String get createCalendarEventTitle => 'Nova sessió';
  @override
  String get createCalendarEventDateLabel => 'Data de la sessió';
  @override
  String get createCalendarEventSubmit => 'Crear sessió';

  // Home

  @override
  String get homeTabEvents => 'Esdeveniments';
  @override
  String get homeTabMembers => 'Socis';
  @override
  String get homeTabBand => 'Associació';
  @override
  String get homeTabProfile => 'Perfil';

  // Membership status

  @override
  String get membershipStatusPendingTitle => "Sol·licitud enviada";
  @override
  String get membershipStatusPendingMessage => "Un gestor revisarà la teva sol·licitud i rebràs una notificació quan sigui acceptada";
  @override
  String get membershipStatusRejectedTitle => 'Sol·licitud rebutjada';
  @override
  String get membershipStatusRejectedMessage => "La teva sol·licitud no ha estat acceptada. Pots enviar una nova sol·licitud";
  @override
  String get membershipStatusBlockedMessage => "No pots tornar a sol·licitar l'accés a aquesta associació";
  @override
  String get membershipStatusReapply => 'Tornar a sol·licitar';
  @override
  String get membershipStatusRefresh => 'Actualitzar estat';

  // Events extras

  @override
  String get eventsActive => 'Actius';
  @override
  String get eventsFinished => 'Finalitzats';
  @override
  String get eventsEmpty => "No hi ha esdeveniments";
  @override
  String get eventDetailFreeEntry => 'Entrada lliure';
  @override
  String get eventDetailRequestAccess => "Sol·licitar accés";
  @override
  String get eventDetailAccessPending => "Sol·licitud pendent";
  @override
  String get eventDetailAccessRejected => 'Accés denegat';
  @override
  String get createEventFreeEntry => 'Entrada lliure';
  @override
  String get createEventEntryCondition => "Condició d'entrada";
  @override
  String get createAppointmentTitle => 'Nova sessió';
  @override
  String get createAppointmentDateLabel => 'Data de la sessió';
  @override
  String get createAppointmentSubmit => 'Crear sessió';

  // Association Detail

  @override
  String get bandDetailTitle => 'Associació';
  @override
  String get bandDetailRequirements => 'Requisits de sol·licitud';
  @override
  String get bandDetailRequireIdDoc => 'Requerir DNI';
  @override
  String get bandDetailRequireIdDocImage => 'Requerir imatge del DNI';
  @override
  String get bandDetailRequireGuardian => 'Requerir dades del tutor';

  // Profile

  @override
  String get profileTitle => 'Perfil';
  @override
  String get profileLogout => 'Tancar sessió';
  @override
  String get profileMemberSince => 'Soci des de';

  // Onboarding extras

  @override
  String get onboardingRequireIdDoc => 'Requerir DNI';
  @override
  String get onboardingRequireIdDocImage => 'Requerir imatge del DNI';
  @override
  String get onboardingRequireGuardian => 'Requerir dades del tutor per a menors';

  // Members

  @override
  String get membersTitle => 'Membres';
  @override
  String get membersEmpty => 'Encara no hi ha membres';
  @override
  String get memberStatusPending => 'Pendent';
  @override
  String get memberStatusApproved => 'Aprovat';
  @override
  String get memberStatusRejected => 'Rebutjat';
  @override
  String get memberRoleManager => 'Gestor';
  @override
  String get memberRoleMember => 'Membre';
  @override
  String get memberBlocked => 'Bloquejat';

  // Member detail

  @override
  String get memberDetailPersonalInfo => 'Informació personal';
  @override
  String get memberDetailEvents => 'Esdeveniments';
  @override
  String get memberDetailNoEvents => 'Sense esdeveniments assignats';
  @override
  String get memberDetailChangeRole => 'Rol';
}
