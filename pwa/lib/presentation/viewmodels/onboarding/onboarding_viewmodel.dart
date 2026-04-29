import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/domain/usecases/association/get_association_conditions_use_case.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/utils/validation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

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
    setLoading(true);
    sl<AssociationRepository>().createAssociation(
      _name.trim(),
      _shortName.trim(),
      _subdomain,
      _primaryColor,
      _secondaryColor,
      onComplete: (String? associationId, dynamic error) async {
        if (error != null || associationId == null) {
          setLoading(false);
          return;
        }
        await _createConditions(associationId);
        await _createFounderMembership(associationId);
        setLoading(false);
        _redirectToAssociation();
      },
    );
  }

  // Private methods

  Future<void> _createConditions(String associationId) async {
    // TODO: call MutationCreateAssociationCondition for each entry in
    // _generalConditions (type: general) and _minorConditions (type: minor)
    // via sl<AssociationRepository>().createCondition(...)
  }

  Future<void> _createFounderMembership(String associationId) async {
    final String? uid = UserManager.instance.user?.uid;
    final String? email = UserManager.instance.userEmail;
    if (uid == null || email == null) return;

    // TODO: use getUserByEmail to check if AppUser already exists.
    // If not, call createAppUser(email, displayName, photoUrl).
    // Then call createFounderMembership(associationId, userId) so the creator
    // gets role=manager + isFounder=true in AssociationMembership.
    sl<MembershipRepository>().getUserByEmail(email, onComplete: (dynamic user, dynamic _) {
      if (user == null) {
        sl<MembershipRepository>().createAppUser(email, _name, '', onComplete: (dynamic id, dynamic __) {});
      }
    });
  }

  void _redirectToAssociation() {
    // TODO: replace NavigationUtils call below with a full browser redirect:
    // import 'dart:js_interop'; or use universal_html:
    //   web.window.location.href = 'https://$_subdomain.samby.app';
    // This must happen after all mutations above are complete.
    NavigationUtils.showSplashView(this);
  }
}
