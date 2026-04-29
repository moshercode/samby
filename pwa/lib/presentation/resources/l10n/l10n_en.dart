import 'package:samby/presentation/resources/l10n/localization.dart';

class L10nEn extends Localization {
  // General

  @override
  String get loading => 'Loading…';
  @override
  String get errorGeneric => 'Something went wrong. Please try again';
  @override
  String get errorNetwork => 'No connection. Check your network';
  @override
  String get cancel => 'Cancel';
  @override
  String get confirm => 'Confirm';
  @override
  String get continueLabel => 'Continue';
  @override
  String get save => 'Save';
  @override
  String get delete => 'Delete';
  @override
  String get edit => 'Edit';

  // Splash

  @override
  String get splashAssociationNotFound => 'Association not found';
  @override
  String get splashAssociationNotFoundSubtitle => 'The link you used does not correspond to any association registered on Samby';

  // Auth

  @override
  String get authLoginTitle => 'Welcome back';
  @override
  String get authLoginSubtitle => 'Sign in to access your association';
  @override
  String get authRegisterTitle => 'Create account';
  @override
  String get authRegisterSubtitle => 'Register to request access';
  @override
  String get authFullName => 'Full name';
  @override
  String get authEmail => 'Email';
  @override
  String get authPassword => 'Password';
  @override
  String get authLoginSubmit => 'Sign in';
  @override
  String get authRegisterSubmit => 'Create account';
  @override
  String get authSwitchToLogin => 'Already have an account? Sign in';
  @override
  String get authSwitchToRegister => "Don't have an account? Register";
  @override
  String get authForgotPassword => 'Forgot your password?';
  @override
  String get authErrorInvalidData => 'Please fill in all fields correctly';
  @override
  String get authErrorInvalidCredentials => 'Incorrect email or password';
  @override
  String get authErrorEmailInUse => 'This email is already in use';
  @override
  String get authErrorWeakPassword => 'Password must be at least 6 characters';
  @override
  String get authErrorTooManyAttempts => 'Too many attempts. Please wait a moment';
  @override
  String get passwordResetTitle => 'Reset password';
  @override
  String get passwordResetSubtitle => 'We will send a recovery link to your email';
  @override
  String get passwordResetSend => 'Send link';
  @override
  String get passwordResetSentConfirmation => 'Check your email';
  @override
  String get passwordResetBack => 'Back to sign in';

  // Onboarding

  @override
  String get onboardingTitle => 'Create your association';
  @override
  String get onboardingSubtitle => 'Set up the basic details of your association';
  @override
  String get onboardingBlock1Title => 'Association information';
  @override
  String get onboardingAssociationName => 'Full name';
  @override
  String get onboardingAssociationShortName => 'Short name';
  @override
  String get onboardingAssociationShortNameHint => 'e.g. The Comparsa';
  @override
  String get onboardingAssociationSubdomain => 'Web address';
  @override
  String get onboardingAssociationSubdomainHint => 'e.g. lacomparsa';
  @override
  String get onboardingPrimaryColor => 'Primary color';
  @override
  String get onboardingSecondaryColor => 'Secondary color';
  @override
  String get onboardingBlock2Title => 'General conditions';
  @override
  String get onboardingBlock3Title => 'Minor conditions';
  @override
  String get onboardingAddCondition => 'Add condition';
  @override
  String get onboardingConditionHint => 'Write the condition…';
  @override
  String get onboardingSubmit => 'Create association';
  @override
  String get onboardingSubdomainTaken => 'This address is already taken';
  @override
  String get onboardingSubdomainInvalid => 'Only lowercase letters, numbers and hyphens';

  // Access request

  @override
  String get accessRequestTitle => 'Request access';
  @override
  String get accessRequestSubtitle => 'Fill in the form to submit your request';
  @override
  String get accessRequestBlock1Title => 'Personal details';
  @override
  String get accessRequestFullName => 'Full name';
  @override
  String get accessRequestBirthDate => 'Date of birth';
  @override
  String get accessRequestBirthDateHint => 'DD/MM/YYYY';
  @override
  String get accessRequestDNI => 'ID / Passport';
  @override
  String get accessRequestUploadDNI => 'Upload ID photo';
  @override
  String get accessRequestDNIUploaded => 'ID uploaded successfully';
  @override
  String get accessRequestMinorWarning => 'You are under 18. We need your legal guardian details';
  @override
  String get accessRequestGuardianTitle => 'Legal guardian details';
  @override
  String get accessRequestGuardianFullName => "Guardian's full name";
  @override
  String get accessRequestGuardianDNI => "Guardian's ID";
  @override
  String get accessRequestUploadGuardianDNI => "Upload guardian's ID photo";
  @override
  String get accessRequestBlock2Title => 'Conditions';
  @override
  String get accessRequestBlock3Title => 'Signature';
  @override
  String get accessRequestSignatureHint => 'Draw your signature in the box';
  @override
  String get accessRequestClearSignature => 'Clear signature';
  @override
  String get accessRequestSubmit => 'Submit request';
  @override
  String get accessRequestSubmitting => 'Submitting request…';

  // Pending approval

  @override
  String get pendingTitle => 'Request submitted';
  @override
  String get pendingSubtitle => 'Your request is being reviewed';
  @override
  String get pendingMessage => 'An association manager will review your request and you will receive a notification when it is accepted';

  // Rejected

  @override
  String get rejectedTitle => 'Request rejected';
  @override
  String get rejectedSubtitle => 'Your request has not been accepted';
  @override
  String get rejectedMessage => 'If you think this is a mistake, you can submit a new request';
  @override
  String get rejectedReapply => 'Request again';
  @override
  String get rejectedBlocked => 'You cannot request access to this association again';

  // Dashboard

  @override
  String get dashboardTitle => 'Home';
}
