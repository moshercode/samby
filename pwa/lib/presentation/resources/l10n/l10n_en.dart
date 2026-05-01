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
  @override
  String get fieldTitle => 'Title';
  @override
  String get fieldDescription => 'Description';
  @override
  String get clearDate => 'Clear date';
  @override
  String get selectAll => 'All';
  @override
  String get selectNone => 'None';

  // Splash

  @override
  String get splashBandNotFound => 'Association not found';
  @override
  String get splashBandNotFoundSubtitle => 'The link you used does not correspond to any association registered on Samby';

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
  String get authPhone => 'Phone';
  @override
  String get authResetCode => 'Verification code';
  @override
  String get authNewPassword => 'New password';
  @override
  String get authResetSubmit => 'Change password';
  @override
  String get authErrorResetTokenInvalid => 'Invalid code';
  @override
  String get authErrorResetTokenExpired => 'The code has expired';
  @override
  String get authErrorResetTokenUsed => 'The code has already been used';
  @override
  String get passwordResetTitle => 'Reset password';
  @override
  String get passwordResetSubtitle => 'We will send a verification code to your email';
  @override
  String get passwordResetSend => 'Send code';
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
  String get onboardingBandName => 'Full name';
  @override
  String get onboardingBandShortName => 'Short name';
  @override
  String get onboardingBandShortNameHint => 'e.g. The Comparsa';
  @override
  String get onboardingBandSubdomain => 'Web address';
  @override
  String get onboardingBandSubdomainHint => 'e.g. lacomparsa';
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
  String get accessRequestIdDoc => 'ID / Passport';
  @override
  String get accessRequestUploadIdDoc => 'Upload ID photo';
  @override
  String get accessRequestIdDocUploaded => 'ID uploaded successfully';
  @override
  String get accessRequestMinorWarning => 'You are under 18. We need your legal guardian details';
  @override
  String get accessRequestGuardianTitle => 'Legal guardian details';
  @override
  String get accessRequestGuardianFullName => "Guardian's full name";
  @override
  String get accessRequestGuardianIdDoc => "Guardian's ID";
  @override
  String get accessRequestUploadGuardianIdDoc => "Upload guardian's ID photo";
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
  @override
  String get dashboardActiveEvents => 'Events';
  @override
  String get dashboardNoEvents => 'No active events';
  @override
  String get eventDetailSessions => 'Sessions';
  @override
  String get eventDetailNoSessions => 'No upcoming sessions';
  @override
  String get eventDetailMembers => 'Access';
  @override
  String get createEventTitle => 'New event';
  @override
  String get createEventStartDate => 'Start date';
  @override
  String get createEventEndDate => 'End date (optional)';
  @override
  String get createEventImageLabel => 'Event image';
  @override
  String get createEventMembersLabel => 'Members with access';
  @override
  String get createEventSubmit => 'Create event';
  @override
  String get createCalendarEventTitle => 'New session';
  @override
  String get createCalendarEventDateLabel => 'Session date';
  @override
  String get createCalendarEventSubmit => 'Create session';

  // Home

  @override
  String get homeTabEvents => 'Events';
  @override
  String get homeTabMembers => 'Members';
  @override
  String get homeTabBand => 'Association';
  @override
  String get homeTabProfile => 'Profile';

  // Membership status

  @override
  String get membershipStatusPendingTitle => 'Request submitted';
  @override
  String get membershipStatusPendingMessage => 'A manager will review your request and you will receive a notification when it is accepted';
  @override
  String get membershipStatusRejectedTitle => 'Request rejected';
  @override
  String get membershipStatusRejectedMessage => 'Your request was not accepted. You can submit a new request';
  @override
  String get membershipStatusBlockedMessage => 'You cannot request access to this association again';
  @override
  String get membershipStatusReapply => 'Request again';
  @override
  String get membershipStatusRefresh => 'Refresh status';

  // Events extras

  @override
  String get eventsActive => 'Active';
  @override
  String get eventsFinished => 'Finished';
  @override
  String get eventsEmpty => 'No events';
  @override
  String get eventDetailFreeEntry => 'Free entry';
  @override
  String get eventDetailRequestAccess => 'Request access';
  @override
  String get eventDetailAccessPending => 'Request pending';
  @override
  String get eventDetailAccessRejected => 'Access denied';
  @override
  String get createEventFreeEntry => 'Free entry';
  @override
  String get createEventEntryCondition => 'Entry condition';
  @override
  String get createAppointmentTitle => 'New session';
  @override
  String get createAppointmentDateLabel => 'Session date';
  @override
  String get createAppointmentSubmit => 'Create session';

  // Association Detail

  @override
  String get bandDetailTitle => 'Association';
  @override
  String get bandDetailRequirements => 'Application requirements';
  @override
  String get bandDetailRequireIdDoc => 'Require ID document';
  @override
  String get bandDetailRequireIdDocImage => 'Require ID document image';
  @override
  String get bandDetailRequireGuardian => 'Require guardian data';

  // Profile

  @override
  String get profileTitle => 'Profile';
  @override
  String get profileLogout => 'Log out';
  @override
  String get profileMemberSince => 'Member since';

  // Onboarding extras

  @override
  String get onboardingRequireIdDoc => 'Require ID document';
  @override
  String get onboardingRequireIdDocImage => 'Require ID document image';
  @override
  String get onboardingRequireGuardian => 'Require guardian data for minors';

  // Members

  @override
  String get membersTitle => 'Members';
  @override
  String get membersEmpty => 'No members yet';
  @override
  String get memberStatusPending => 'Pending';
  @override
  String get memberStatusApproved => 'Approved';
  @override
  String get memberStatusRejected => 'Rejected';
  @override
  String get memberRoleManager => 'Manager';
  @override
  String get memberRoleMember => 'Member';
  @override
  String get memberBlocked => 'Blocked';

  // Member detail

  @override
  String get memberDetailPersonalInfo => 'Personal information';
  @override
  String get memberDetailEvents => 'Events';
  @override
  String get memberDetailNoEvents => 'No events assigned';
  @override
  String get memberDetailChangeRole => 'Role';
}
