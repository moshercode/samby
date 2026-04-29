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

  // Splash

  @override
  String get splashAssociationNotFound => 'Associació no trobada';
  @override
  String get splashAssociationNotFoundSubtitle => "L'enllaç que has utilitzat no correspon a cap associació registrada a Samby";

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
  String get passwordResetTitle => 'Recupera la contrasenya';
  @override
  String get passwordResetSubtitle => "T'enviarem un enllaç de recuperació al correu";
  @override
  String get passwordResetSend => "Envia l'enllaç";
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
  String get onboardingAssociationName => 'Nom complet';
  @override
  String get onboardingAssociationShortName => 'Nom curt';
  @override
  String get onboardingAssociationShortNameHint => 'Ex: La Comparsa';
  @override
  String get onboardingAssociationSubdomain => 'Adreça web';
  @override
  String get onboardingAssociationSubdomainHint => 'Ex: lacomparsa';
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
  String get accessRequestDNI => 'DNI / NIE';
  @override
  String get accessRequestUploadDNI => 'Puja la foto del DNI';
  @override
  String get accessRequestDNIUploaded => 'DNI pujat correctament';
  @override
  String get accessRequestMinorWarning => "Ets menor d'edat. Necessitem les dades del teu tutor legal";
  @override
  String get accessRequestGuardianTitle => 'Dades del tutor legal';
  @override
  String get accessRequestGuardianFullName => 'Nom complet del tutor';
  @override
  String get accessRequestGuardianDNI => 'DNI del tutor';
  @override
  String get accessRequestUploadGuardianDNI => 'Puja la foto del DNI del tutor';
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
}
