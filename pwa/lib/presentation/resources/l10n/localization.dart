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

  // ── Splash ─────────────────────────────────────────

  String get splashAssociationNotFound;
  String get splashAssociationNotFoundSubtitle;

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
  String get passwordResetTitle;
  String get passwordResetSubtitle;
  String get passwordResetSend;
  String get passwordResetSentConfirmation;
  String get passwordResetBack;

  // ── Onboarding ─────────────────────────────────────

  String get onboardingTitle;
  String get onboardingSubtitle;
  String get onboardingBlock1Title;
  String get onboardingAssociationName;
  String get onboardingAssociationShortName;
  String get onboardingAssociationShortNameHint;
  String get onboardingAssociationSubdomain;
  String get onboardingAssociationSubdomainHint;
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
  String get accessRequestDNI;
  String get accessRequestUploadDNI;
  String get accessRequestDNIUploaded;
  String get accessRequestMinorWarning;
  String get accessRequestGuardianTitle;
  String get accessRequestGuardianFullName;
  String get accessRequestGuardianDNI;
  String get accessRequestUploadGuardianDNI;
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

  // ── Dashboard ──────────────────────────────────────

  String get dashboardTitle;
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
