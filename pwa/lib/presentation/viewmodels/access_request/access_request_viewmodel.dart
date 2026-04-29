import 'package:samby/domain/entities/association_condition.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/utils/validation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class AccessRequestViewModel extends ViewModel {
  // Variables

  String memberName = '';
  String memberBirthDateRaw = '';
  String memberDNI = '';
  String? memberDNIImageUrl;
  String? guardianName;
  String? guardianDNI;
  String? guardianDNIImageUrl;
  String? signatureUrl;

  bool _allGeneralConditionsAccepted = false;
  bool _allMinorConditionsAccepted = false;

  List<AssociationCondition> generalConditions = <AssociationCondition>[];
  List<AssociationCondition> minorConditions = <AssociationCondition>[];

  bool get isMinor {
    try {
      final List<String> parts = memberBirthDateRaw.split('/');
      if (parts.length != 3) return false;
      final DateTime birthDate = DateTime(
        int.parse(parts[2]),
        int.parse(parts[1]),
        int.parse(parts[0]),
      );
      return ValidationUtils.isMinor(birthDate);
    } catch (_) {
      return false;
    }
  }

  bool get allGeneralConditionsAccepted => _allGeneralConditionsAccepted;
  set allGeneralConditionsAccepted(bool v) {
    _allGeneralConditionsAccepted = v;
    notifyListeners();
  }

  bool get allMinorConditionsAccepted => _allMinorConditionsAccepted;
  set allMinorConditionsAccepted(bool v) {
    _allMinorConditionsAccepted = v;
    notifyListeners();
  }

  bool get hasExistingMembership =>
      SessionDataManager.instance.membership?.status == MembershipStatus.rejected;

  bool get isReadyToSubmit {
    final bool block1Valid =
        memberName.trim().isNotEmpty &&
        memberBirthDateRaw.trim().isNotEmpty &&
        memberDNI.trim().isNotEmpty &&
        memberDNIImageUrl != null;
    final bool guardianValid = !isMinor ||
        (guardianName?.isNotEmpty == true &&
            guardianDNI?.isNotEmpty == true &&
            guardianDNIImageUrl != null);
    final bool conditionsValid = _allGeneralConditionsAccepted &&
        (!isMinor || _allMinorConditionsAccepted);
    final bool signatureValid = signatureUrl != null;
    return block1Valid && guardianValid && conditionsValid && signatureValid;
  }

  // Constructor

  AccessRequestViewModel();

  @override
  String getScreenName() => 'access_request';

  @override
  void onStart() {
    super.onStart();
    _loadConditions();
  }

  // Public methods

  void onNameChanged(String v) {
    memberName = v;
    notifyListeners();
  }

  void onBirthDateChanged(String v) {
    memberBirthDateRaw = v;
    notifyListeners();
  }

  void onDNIChanged(String v) {
    memberDNI = v;
    notifyListeners();
  }

  void onDNIImageUploaded(String url) {
    memberDNIImageUrl = url;
    notifyListeners();
  }

  void onGuardianNameChanged(String v) {
    guardianName = v;
    notifyListeners();
  }

  void onGuardianDNIChanged(String v) {
    guardianDNI = v;
    notifyListeners();
  }

  void onGuardianDNIImageUploaded(String url) {
    guardianDNIImageUrl = url;
    notifyListeners();
  }

  void onSignatureUploaded(String url) {
    signatureUrl = url;
    notifyListeners();
  }

  Future<void> submit() async {
    if (!isReadyToSubmit) return;
    setLoading(true);
    // TODO: implement full submission flow:
    // 1. If AppUser doesn't exist yet, create it via MembershipRepository.createAppUser
    // 2. Upload DNI image to Firebase Storage path:
    //    memberships/{associationId}/{userId}/dni/dni.jpg
    //    → set memberDNIImageUrl
    // 3. If isMinor, upload guardian DNI to:
    //    memberships/{associationId}/{userId}/guardian_dni/guardian_dni.jpg
    //    → set guardianDNIImageUrl
    // 4. Upload signature PNG (from SignatureController.toPngBytes()) to:
    //    memberships/{associationId}/{userId}/signature/signature.png
    //    → set signatureUrl
    // 5. If hasExistingMembership → call ResetMembership mutation
    //    else → call CreateMembership mutation
    //    Fields: associationId, userId, memberName, memberDNI, memberDNIImageUrl,
    //            guardianName?, guardianDNI?, guardianDNIImageUrl?, signatureUrl,
    //            status: pending, role: member, isFounder: false
    // 6. On success → NavigationUtils.showPendingApprovalView(this)
    setLoading(false);
    NavigationUtils.showPendingApprovalView(this);
  }

  // Private methods

  void _loadConditions() {
    // TODO: fetch conditions from AssociationRepository.getAssociationConditions(associationId)
    // Split results by ConditionType: general → generalConditions, minor → minorConditions
    // Call notifyListeners() after populating the lists
    notifyListeners();
  }
}
