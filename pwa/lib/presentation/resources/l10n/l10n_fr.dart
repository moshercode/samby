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
  @override
  String get fieldTitle => 'Titre';
  @override
  String get fieldDescription => 'Description';
  @override
  String get clearDate => 'Effacer la date';
  @override
  String get selectAll => 'Tous';
  @override
  String get selectNone => 'Aucun';

  // Splash

  @override
  String get splashBandNotFound => 'Association introuvable';
  @override
  String get splashBandNotFoundSubtitle => "Le lien que vous avez utilisé ne correspond à aucune association enregistrée sur Samby";

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
  String get authPhone => 'Téléphone';
  @override
  String get authResetCode => 'Code de vérification';
  @override
  String get authNewPassword => 'Nouveau mot de passe';
  @override
  String get authResetSubmit => 'Changer le mot de passe';
  @override
  String get authErrorResetTokenInvalid => 'Code invalide';
  @override
  String get authErrorResetTokenExpired => 'Le code a expiré';
  @override
  String get authErrorResetTokenUsed => 'Le code a déjà été utilisé';
  @override
  String get passwordResetTitle => 'Réinitialiser le mot de passe';
  @override
  String get passwordResetSubtitle => 'Nous enverrons un code de vérification à votre email';
  @override
  String get passwordResetSend => 'Envoyer le code';
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
  String get onboardingBandName => 'Nom complet';
  @override
  String get onboardingBandShortName => 'Nom court';
  @override
  String get onboardingBandShortNameHint => 'Ex : La Comparsa';
  @override
  String get onboardingBandSubdomain => 'Adresse web';
  @override
  String get onboardingBandSubdomainHint => 'Ex : lacomparsa';
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
  String get accessRequestIdDoc => "Carte d'identité / Passeport";
  @override
  String get accessRequestUploadIdDoc => "Télécharger la photo d'identité";
  @override
  String get accessRequestIdDocUploaded => "Pièce d'identité téléchargée";
  @override
  String get accessRequestMinorWarning => "Vous avez moins de 18 ans. Nous avons besoin des informations de votre tuteur légal";
  @override
  String get accessRequestGuardianTitle => 'Informations du tuteur légal';
  @override
  String get accessRequestGuardianFullName => 'Nom complet du tuteur';
  @override
  String get accessRequestGuardianIdDoc => "Pièce d'identité du tuteur";
  @override
  String get accessRequestUploadGuardianIdDoc => "Télécharger la pièce d'identité du tuteur";
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
  String get pendingSubtitle => "Votre demande est en cours d'examen";
  @override
  String get pendingMessage => "Un manager de l'association examinera votre demande et vous recevrez une notification dès qu'elle sera acceptée";

  // Rejected

  @override
  String get rejectedTitle => 'Demande refusée';
  @override
  String get rejectedSubtitle => "Votre demande n'a pas été acceptée";
  @override
  String get rejectedMessage => "Si vous pensez que c'est une erreur, vous pouvez soumettre une nouvelle demande";
  @override
  String get rejectedReapply => 'Redemander';
  @override
  String get rejectedBlocked => "Vous ne pouvez plus demander l'accès à cette association";

  // Dashboard

  @override
  String get dashboardTitle => 'Accueil';
  @override
  String get dashboardActiveEvents => 'Événements';
  @override
  String get dashboardNoEvents => 'Aucun événement actif';
  @override
  String get eventDetailSessions => 'Séances';
  @override
  String get eventDetailNoSessions => 'Aucune séance à venir';
  @override
  String get eventDetailMembers => 'Accès';
  @override
  String get createEventTitle => 'Nouvel événement';
  @override
  String get createEventStartDate => 'Date de début';
  @override
  String get createEventEndDate => 'Date de fin (facultatif)';
  @override
  String get createEventImageLabel => "Image de l'événement";
  @override
  String get createEventMembersLabel => 'Membres avec accès';
  @override
  String get createEventSubmit => "Créer l'événement";
  @override
  String get createCalendarEventTitle => 'Nouvelle séance';
  @override
  String get createCalendarEventDateLabel => 'Date de la séance';
  @override
  String get createCalendarEventSubmit => 'Créer la séance';

  // Home

  @override
  String get homeTabEvents => 'Événements';
  @override
  String get homeTabMembers => 'Membres';
  @override
  String get homeTabBand => 'Association';
  @override
  String get homeTabProfile => 'Profil';

  // Membership status

  @override
  String get membershipStatusPendingTitle => 'Demande envoyée';
  @override
  String get membershipStatusPendingMessage => "Un responsable examinera votre demande et vous recevrez une notification dès qu'elle sera acceptée";
  @override
  String get membershipStatusRejectedTitle => 'Demande refusée';
  @override
  String get membershipStatusRejectedMessage => "Votre demande n'a pas été acceptée. Vous pouvez soumettre une nouvelle demande";
  @override
  String get membershipStatusBlockedMessage => "Vous ne pouvez plus demander l'accès à cette association";
  @override
  String get membershipStatusReapply => 'Redemander';
  @override
  String get membershipStatusRefresh => 'Actualiser le statut';

  // Events extras

  @override
  String get eventsActive => 'Actifs';
  @override
  String get eventsFinished => 'Terminés';
  @override
  String get eventsEmpty => 'Aucun événement';
  @override
  String get eventDetailFreeEntry => 'Entrée libre';
  @override
  String get eventDetailRequestAccess => "Demander l'accès";
  @override
  String get eventDetailAccessPending => 'Demande en attente';
  @override
  String get eventDetailAccessRejected => 'Accès refusé';
  @override
  String get createEventFreeEntry => 'Entrée libre';
  @override
  String get createEventEntryCondition => "Condition d'entrée";
  @override
  String get createAppointmentTitle => 'Nouvelle séance';
  @override
  String get createAppointmentDateLabel => 'Date de la séance';
  @override
  String get createAppointmentSubmit => 'Créer la séance';

  // Association Detail

  @override
  String get bandDetailTitle => 'Association';
  @override
  String get bandDetailRequirements => 'Exigences de candidature';
  @override
  String get bandDetailRequireIdDoc => "Exiger une pièce d'identité";
  @override
  String get bandDetailRequireIdDocImage => "Exiger l'image de la pièce d'identité";
  @override
  String get bandDetailRequireGuardian => 'Exiger les données du tuteur';

  // Profile

  @override
  String get profileTitle => 'Profil';
  @override
  String get profileLogout => 'Se déconnecter';
  @override
  String get profileMemberSince => 'Membre depuis';

  // Onboarding extras

  @override
  String get onboardingRequireIdDoc => "Exiger une pièce d'identité";
  @override
  String get onboardingRequireIdDocImage => "Exiger l'image de la pièce d'identité";
  @override
  String get onboardingRequireGuardian => 'Exiger les données du tuteur pour les mineurs';

  // Members

  @override
  String get membersTitle => 'Membres';
  @override
  String get membersEmpty => "Aucun membre pour l'instant";
  @override
  String get memberStatusPending => 'En attente';
  @override
  String get memberStatusApproved => 'Approuvé';
  @override
  String get memberStatusRejected => 'Refusé';
  @override
  String get memberRoleManager => 'Responsable';
  @override
  String get memberRoleMember => 'Membre';
  @override
  String get memberBlocked => 'Bloqué';

  // Member detail

  @override
  String get memberDetailPersonalInfo => 'Informations personnelles';
  @override
  String get memberDetailEvents => 'Événements';
  @override
  String get memberDetailNoEvents => 'Aucun événement assigné';
  @override
  String get memberDetailChangeRole => 'Rôle';
}
