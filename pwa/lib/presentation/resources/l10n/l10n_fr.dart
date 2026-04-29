import 'package:samby/presentation/resources/l10n/localization.dart';

class L10nFr extends Localization {
  // General

  @override
  String get loading => 'Chargement…';
  @override
  String get errorGeneric => "Une erreur s'est produite. Veuillez réessayer";
  @override
  String get errorNetwork => "Pas de connexion. Vérifiez votre réseau";
  @override
  String get cancel => 'Annuler';
  @override
  String get confirm => 'Confirmer';
  @override
  String get continueLabel => 'Continuer';
  @override
  String get save => 'Enregistrer';
  @override
  String get delete => 'Supprimer';
  @override
  String get edit => 'Modifier';

  // Splash

  @override
  String get splashAssociationNotFound => 'Association introuvable';
  @override
  String get splashAssociationNotFoundSubtitle => "Le lien que vous avez utilisé ne correspond à aucune association enregistrée sur Samby";

  // Auth

  @override
  String get authLoginTitle => 'Bon retour';
  @override
  String get authLoginSubtitle => 'Connectez-vous pour accéder à votre association';
  @override
  String get authRegisterTitle => 'Créer un compte';
  @override
  String get authRegisterSubtitle => "Inscrivez-vous pour demander l'accès";
  @override
  String get authFullName => 'Nom complet';
  @override
  String get authEmail => 'Email';
  @override
  String get authPassword => 'Mot de passe';
  @override
  String get authLoginSubmit => 'Se connecter';
  @override
  String get authRegisterSubmit => 'Créer un compte';
  @override
  String get authSwitchToLogin => 'Déjà un compte ? Se connecter';
  @override
  String get authSwitchToRegister => "Pas de compte ? S'inscrire";
  @override
  String get authForgotPassword => 'Mot de passe oublié ?';
  @override
  String get authErrorInvalidData => 'Veuillez remplir tous les champs correctement';
  @override
  String get authErrorInvalidCredentials => 'Email ou mot de passe incorrect';
  @override
  String get authErrorEmailInUse => 'Cet email est déjà utilisé';
  @override
  String get authErrorWeakPassword => 'Le mot de passe doit contenir au moins 6 caractères';
  @override
  String get authErrorTooManyAttempts => 'Trop de tentatives. Veuillez patienter';
  @override
  String get passwordResetTitle => 'Réinitialiser le mot de passe';
  @override
  String get passwordResetSubtitle => 'Nous enverrons un lien de récupération à votre email';
  @override
  String get passwordResetSend => 'Envoyer le lien';
  @override
  String get passwordResetSentConfirmation => 'Vérifiez votre email';
  @override
  String get passwordResetBack => 'Retour à la connexion';

  // Onboarding

  @override
  String get onboardingTitle => 'Créez votre association';
  @override
  String get onboardingSubtitle => "Configurez les informations de base de votre association";
  @override
  String get onboardingBlock1Title => "Informations de l'association";
  @override
  String get onboardingAssociationName => 'Nom complet';
  @override
  String get onboardingAssociationShortName => 'Nom court';
  @override
  String get onboardingAssociationShortNameHint => 'Ex : La Comparsa';
  @override
  String get onboardingAssociationSubdomain => 'Adresse web';
  @override
  String get onboardingAssociationSubdomainHint => 'Ex : lacomparsa';
  @override
  String get onboardingPrimaryColor => 'Couleur primaire';
  @override
  String get onboardingSecondaryColor => 'Couleur secondaire';
  @override
  String get onboardingBlock2Title => 'Conditions générales';
  @override
  String get onboardingBlock3Title => 'Conditions pour mineurs';
  @override
  String get onboardingAddCondition => 'Ajouter une condition';
  @override
  String get onboardingConditionHint => 'Écrivez la condition…';
  @override
  String get onboardingSubmit => "Créer l'association";
  @override
  String get onboardingSubdomainTaken => 'Cette adresse est déjà utilisée';
  @override
  String get onboardingSubdomainInvalid => 'Lettres minuscules, chiffres et tirets uniquement';

  // Access request

  @override
  String get accessRequestTitle => "Demander l'accès";
  @override
  String get accessRequestSubtitle => 'Remplissez le formulaire pour soumettre votre demande';
  @override
  String get accessRequestBlock1Title => 'Informations personnelles';
  @override
  String get accessRequestFullName => 'Nom complet';
  @override
  String get accessRequestBirthDate => 'Date de naissance';
  @override
  String get accessRequestBirthDateHint => 'JJ/MM/AAAA';
  @override
  String get accessRequestDNI => 'Carte d\'identité / Passeport';
  @override
  String get accessRequestUploadDNI => "Télécharger la photo d'identité";
  @override
  String get accessRequestDNIUploaded => 'Pièce d\'identité téléchargée';
  @override
  String get accessRequestMinorWarning => "Vous avez moins de 18 ans. Nous avons besoin des informations de votre tuteur légal";
  @override
  String get accessRequestGuardianTitle => 'Informations du tuteur légal';
  @override
  String get accessRequestGuardianFullName => 'Nom complet du tuteur';
  @override
  String get accessRequestGuardianDNI => "Pièce d'identité du tuteur";
  @override
  String get accessRequestUploadGuardianDNI => "Télécharger la pièce d'identité du tuteur";
  @override
  String get accessRequestBlock2Title => 'Conditions';
  @override
  String get accessRequestBlock3Title => 'Signature';
  @override
  String get accessRequestSignatureHint => 'Dessinez votre signature dans le cadre';
  @override
  String get accessRequestClearSignature => 'Effacer la signature';
  @override
  String get accessRequestSubmit => 'Envoyer la demande';
  @override
  String get accessRequestSubmitting => 'Envoi en cours…';

  // Pending approval

  @override
  String get pendingTitle => 'Demande envoyée';
  @override
  String get pendingSubtitle => 'Votre demande est en cours d\'examen';
  @override
  String get pendingMessage => "Un manager de l'association examinera votre demande et vous recevrez une notification dès qu'elle sera acceptée";

  // Rejected

  @override
  String get rejectedTitle => 'Demande refusée';
  @override
  String get rejectedSubtitle => "Votre demande n'a pas été acceptée";
  @override
  String get rejectedMessage => 'Si vous pensez que c\'est une erreur, vous pouvez soumettre une nouvelle demande';
  @override
  String get rejectedReapply => 'Redemander';
  @override
  String get rejectedBlocked => "Vous ne pouvez plus demander l'accès à cette association";

  // Dashboard

  @override
  String get dashboardTitle => 'Accueil';
}
