import 'dart:async';

import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/utils/validation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';
import 'package:web/web.dart' as web;

class OnboardingViewModel extends ViewModel {
  // Variables

  String _name = '';
  String _shortName = '';
  String _subdomain = '';
  String _primaryColor = '#3D5AFE';
  String _secondaryColor = '#000000';
  final List<String> _generalConditions = <String>[];
  final List<String> _minorConditions = <String>[];
  String? _subdomainError;

  String get name => _name;
  set name(String v) {
    _name = v;
    notifyListeners();
  }

  String get shortName => _shortName;
  set shortName(String v) {
    _shortName = v;
    _subdomain = ValidationUtils.toSubdomain(v);
    _subdomainError = null;
    notifyListeners();
  }

  String get subdomain => _subdomain;
  set subdomain(String v) {
    _subdomain = v;
    _subdomainError = null;
    notifyListeners();
  }

  String get primaryColor => _primaryColor;
  set primaryColor(String v) {
    _primaryColor = v;
    notifyListeners();
  }

  String get secondaryColor => _secondaryColor;
  set secondaryColor(String v) {
    _secondaryColor = v;
    notifyListeners();
  }

  bool _requireIdDoc = false;
  bool _requireIdDocImage = false;
  bool _requireGuardian = false;

  bool get requireIdDoc => _requireIdDoc;
  set requireIdDoc(bool v) { _requireIdDoc = v; notifyListeners(); }

  bool get requireIdDocImage => _requireIdDocImage;
  set requireIdDocImage(bool v) { _requireIdDocImage = v; notifyListeners(); }

  bool get requireGuardian => _requireGuardian;
  set requireGuardian(bool v) { _requireGuardian = v; notifyListeners(); }

  List<String> get generalConditions => List<String>.unmodifiable(_generalConditions);
  List<String> get minorConditions => List<String>.unmodifiable(_minorConditions);
  String? get subdomainError => _subdomainError;

  bool get isValid =>
      _name.trim().isNotEmpty &&
      _shortName.trim().isNotEmpty &&
      ValidationUtils.isValidSubdomain(_subdomain);

  // Constructor

  OnboardingViewModel();

  @override
  String getScreenName() => 'onboarding';

  // Public methods

  void addGeneralCondition(String content) {
    if (content.trim().isNotEmpty) {
      _generalConditions.add(content.trim());
      notifyListeners();
    }
  }

  void removeGeneralCondition(int index) {
    _generalConditions.removeAt(index);
    notifyListeners();
  }

  void addMinorCondition(String content) {
    if (content.trim().isNotEmpty) {
      _minorConditions.add(content.trim());
      notifyListeners();
    }
  }

  void removeMinorCondition(int index) {
    _minorConditions.removeAt(index);
    notifyListeners();
  }

  Future<void> submit() async {
    if (!isValid) return;
    if (!ValidationUtils.isValidSubdomain(_subdomain)) {
      _subdomainError = 'invalid';
      notifyListeners();
      return;
    }
    final String founderEmail = UserManager.instance.userEmail ?? '';
    setLoading(true);
    sl<AssociationRepository>().createAssociation(
      _name.trim(),
      _shortName.trim(),
      _subdomain,
      _primaryColor,
      _secondaryColor,
      founderEmail,
      onComplete: (String? associationId, dynamic error) async {
        if (error != null || associationId == null) {
          setLoading(false);
          return;
        }
        await _createConditions(associationId);
        await _createFounderMembership(associationId);
        await _updateAssociationSettings(associationId);
        setLoading(false);
        _redirectToAssociation();
      },
    );
  }

  // Private methods

  Future<void> _createConditions(String associationId) async {
    final List<Future<void>> tasks = <Future<void>>[];

    for (int i = 0; i < _generalConditions.length; i++) {
      final Completer<void> c = Completer<void>();
      sl<AssociationRepository>().createCondition(
        associationId, 'general', _generalConditions[i], i,
        onComplete: (_) => c.complete(),
      );
      tasks.add(c.future);
    }

    for (int i = 0; i < _minorConditions.length; i++) {
      final Completer<void> c = Completer<void>();
      sl<AssociationRepository>().createCondition(
        associationId, 'minor', _minorConditions[i], i,
        onComplete: (_) => c.complete(),
      );
      tasks.add(c.future);
    }

    await Future.wait(tasks);
  }

  Future<void> _createFounderMembership(String associationId) async {
    final String? email = UserManager.instance.userEmail;
    if (email == null) return;
    final String displayName = UserManager.instance.user?.displayName ?? email;

    final Completer<void> completer = Completer<void>();
    sl<MemberRepository>().createFounderMember(
      associationId,
      displayName,
      email,
      onComplete: (_) => completer.complete(),
    );
    await completer.future;
  }

  Future<void> _updateAssociationSettings(String associationId) async {
    final Completer<void> completer = Completer<void>();
    sl<AssociationRepository>().updateAssociation(
      associationId,
      requireIdDoc: _requireIdDoc,
      requireIdDocImage: _requireIdDocImage,
      requireGuardian: _requireGuardian,
      onComplete: (_) => completer.complete(),
    );
    await completer.future;
  }

  void _redirectToAssociation() {
    web.window.location.href = 'https://$_subdomain.samby.app';
  }
}
