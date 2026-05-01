import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:samby/presentation/resources/l10n/l10n_ca.dart';
import 'package:samby/presentation/resources/l10n/l10n_de.dart';
import 'package:samby/presentation/resources/l10n/l10n_en.dart';
import 'package:samby/presentation/resources/l10n/l10n_es.dart';
import 'package:samby/presentation/resources/l10n/l10n_fr.dart';
import 'package:samby/presentation/resources/l10n/l10n_it.dart';
import 'package:samby/presentation/resources/l10n/l10n_pt.dart';

abstract class Localization {
  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization)!;
  }

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    _AppL10nDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('de'),
    Locale('pt'),
    Locale('it'),
    Locale('ca'),
  ];

  // ── General ────────────────────────────────────────

  String get loading;
  String get errorGeneric;
  String get errorNetwork;
  String get cancel;
  String get confirm;
  String get continueLabel;
  String get save;
  String get delete;
  String get edit;
  String get fieldTitle;
  String get fieldDescription;
  String get clearDate;
  String get selectAll;
  String get selectNone;

  // ── Splash ─────────────────────────────────────────

  String get splashBandNotFound;
  String get splashBandNotFoundSubtitle;

  // ── Auth ───────────────────────────────────────────

  String get authLoginTitle;
  String get authLoginSubtitle;
  String get authRegisterTitle;
  String get authRegisterSubtitle;
  String get authFullName;
  String get authEmail;
  String get authPassword;
  String get authLoginSubmit;
  String get authRegisterSubmit;
  String get authSwitchToLogin;
  String get authSwitchToRegister;
  String get authForgotPassword;
  String get authErrorInvalidData;
  String get authErrorInvalidCredentials;
  String get authErrorEmailInUse;
  String get authErrorWeakPassword;
  String get authErrorTooManyAttempts;
  String get authPhone;
  String get authResetCode;
  String get authNewPassword;
  String get authResetSubmit;
  String get authErrorResetTokenInvalid;
  String get authErrorResetTokenExpired;
  String get authErrorResetTokenUsed;
  String get passwordResetTitle;
  String get passwordResetSubtitle;
  String get passwordResetSend;
  String get passwordResetSentConfirmation;
  String get passwordResetBack;

  // ── Onboarding ─────────────────────────────────────

  String get onboardingTitle;
  String get onboardingSubtitle;
  String get onboardingBlock1Title;
  String get onboardingBandName;
  String get onboardingBandShortName;
  String get onboardingBandShortNameHint;
  String get onboardingBandSubdomain;
  String get onboardingBandSubdomainHint;
  String get onboardingPrimaryColor;
  String get onboardingSecondaryColor;
  String get onboardingBlock2Title;
  String get onboardingBlock3Title;
  String get onboardingAddCondition;
  String get onboardingConditionHint;
  String get onboardingSubmit;
  String get onboardingSubdomainTaken;
  String get onboardingSubdomainInvalid;

  // ── Access request ─────────────────────────────────

  String get accessRequestTitle;
  String get accessRequestSubtitle;
  String get accessRequestBlock1Title;
  String get accessRequestFullName;
  String get accessRequestBirthDate;
  String get accessRequestBirthDateHint;
  String get accessRequestIdDoc;
  String get accessRequestUploadIdDoc;
  String get accessRequestIdDocUploaded;
  String get accessRequestMinorWarning;
  String get accessRequestGuardianTitle;
  String get accessRequestGuardianFullName;
  String get accessRequestGuardianIdDoc;
  String get accessRequestUploadGuardianIdDoc;
  String get accessRequestBlock2Title;
  String get accessRequestBlock3Title;
  String get accessRequestSignatureHint;
  String get accessRequestClearSignature;
  String get accessRequestSubmit;
  String get accessRequestSubmitting;

  // ── Pending approval ───────────────────────────────

  String get pendingTitle;
  String get pendingSubtitle;
  String get pendingMessage;

  // ── Rejected ───────────────────────────────────────

  String get rejectedTitle;
  String get rejectedSubtitle;
  String get rejectedMessage;
  String get rejectedReapply;
  String get rejectedBlocked;

  // ── Home ───────────────────────────────────────────

  String get homeTabEvents;
  String get homeTabMembers;
  String get homeTabBand;
  String get homeTabProfile;

  // ── Membership status ───────────────────────────────

  String get membershipStatusPendingTitle;
  String get membershipStatusPendingMessage;
  String get membershipStatusRejectedTitle;
  String get membershipStatusRejectedMessage;
  String get membershipStatusBlockedMessage;
  String get membershipStatusReapply;
  String get membershipStatusRefresh;

  // ── Dashboard (legacy) ──────────────────────────────

  String get dashboardTitle;
  String get dashboardActiveEvents;
  String get dashboardNoEvents;

  // ── Events ─────────────────────────────────────────

  String get eventsActive;
  String get eventsFinished;
  String get eventsEmpty;
  String get eventDetailSessions;
  String get eventDetailNoSessions;
  String get eventDetailMembers;
  String get eventDetailFreeEntry;
  String get eventDetailRequestAccess;
  String get eventDetailAccessPending;
  String get eventDetailAccessRejected;
  String get createEventTitle;
  String get createEventStartDate;
  String get createEventEndDate;
  String get createEventImageLabel;
  String get createEventMembersLabel;
  String get createEventFreeEntry;
  String get createEventEntryCondition;
  String get createEventSubmit;
  String get createCalendarEventTitle;
  String get createCalendarEventDateLabel;
  String get createCalendarEventSubmit;
  String get createAppointmentTitle;
  String get createAppointmentDateLabel;
  String get createAppointmentSubmit;

  // ── Band Detail ──────────────────────────────

  String get bandDetailTitle;
  String get bandDetailRequirements;
  String get bandDetailRequireIdDoc;
  String get bandDetailRequireIdDocImage;
  String get bandDetailRequireGuardian;

  // ── Profile ─────────────────────────────────────────

  String get profileTitle;
  String get profileLogout;
  String get profileMemberSince;

  // ── Onboarding extras ───────────────────────────────

  String get onboardingRequireIdDoc;
  String get onboardingRequireIdDocImage;
  String get onboardingRequireGuardian;

  // ── Members ────────────────────────────────────────

  String get membersTitle;
  String get membersEmpty;
  String get memberStatusPending;
  String get memberStatusApproved;
  String get memberStatusRejected;
  String get memberRoleManager;
  String get memberRoleMember;
  String get memberBlocked;

  // ── Member detail ──────────────────────────────────
  String get memberDetailPersonalInfo;
  String get memberDetailEvents;
  String get memberDetailNoEvents;
  String get memberDetailChangeRole;
}

// ── Delegate ──────────────────────────────────────────────────────────────────

class _AppL10nDelegate extends LocalizationsDelegate<Localization> {
  const _AppL10nDelegate();

  @override
  bool isSupported(Locale locale) =>
      Localization.supportedLocales.firstWhereOrNull(
        (Locale l) => l.languageCode == locale.languageCode,
      ) !=
      null;

  @override
  Future<Localization> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'ca':
        return L10nCa();
      case 'es':
        return L10nEs();
      case 'fr':
        return L10nFr();
      case 'de':
        return L10nDe();
      case 'pt':
        return L10nPt();
      case 'it':
        return L10nIt();
      default:
        return L10nEn();
    }
  }

  @override
  bool shouldReload(_AppL10nDelegate old) => false;
}
