import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samby/core/di/service_locator.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/domain/entities/association_condition.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/utils/validation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class AccessRequestViewModel extends ViewModel {
  // Variables

  String memberName = '';
  String memberBirthDateRaw = '';
  String memberDni = '';
  String? memberDniImageUrl;
  String? guardianName;
  String? guardianDni;
  String? guardianDniImageUrl;
  String? signatureUrl;

  bool isDniUploading = false;
  bool isGuardianDniUploading = false;
  bool isSignatureUploading = false;

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

  bool get hasExistingApplication =>
      SessionDataManager.instance.member?.status == MemberStatus.rejected;

  bool get requireDni => SessionDataManager.instance.association?.requireDni ?? false;
  bool get requireDniImage => SessionDataManager.instance.association?.requireDniImage ?? false;
  bool get requireGuardian => SessionDataManager.instance.association?.requireGuardian ?? false;

  bool get isReadyToSubmit {
    final bool nameValid = memberName.trim().isNotEmpty;
    final bool birthDateValid = memberBirthDateRaw.trim().isNotEmpty;
    final bool dniValid = !requireDni || memberDni.trim().isNotEmpty;
    final bool dniImageValid = !requireDniImage || memberDniImageUrl != null;
    final bool guardianValid = !requireGuardian || !isMinor ||
        (guardianName?.isNotEmpty == true &&
            guardianDni?.isNotEmpty == true &&
            guardianDniImageUrl != null);
    final bool conditionsValid = _allGeneralConditionsAccepted &&
        (!isMinor || _allMinorConditionsAccepted);
    final bool signatureValid = signatureUrl != null && signatureUrl!.isNotEmpty;
    return nameValid && birthDateValid && dniValid && dniImageValid &&
        guardianValid && conditionsValid && signatureValid;
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

  void onDniChanged(String v) {
    memberDni = v;
    notifyListeners();
  }

  void onDniImageUploaded(String url) {
    memberDniImageUrl = url;
    notifyListeners();
  }

  void onGuardianNameChanged(String v) {
    guardianName = v;
    notifyListeners();
  }

  void onGuardianDniChanged(String v) {
    guardianDni = v;
    notifyListeners();
  }

  void onGuardianDniImageUploaded(String url) {
    guardianDniImageUrl = url;
    notifyListeners();
  }

  void onSignatureUploaded(String url) {
    signatureUrl = url.isEmpty ? null : url;
    notifyListeners();
  }

  Future<void> pickAndUploadMemberDni() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    isDniUploading = true;
    notifyListeners();
    final Uint8List bytes = await file.readAsBytes();
    final String? url = await _uploadToStorage(bytes, _storagePath('dni/dni.jpg'));
    if (url != null) memberDniImageUrl = url;
    isDniUploading = false;
    notifyListeners();
  }

  Future<void> pickAndUploadGuardianDni() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    isGuardianDniUploading = true;
    notifyListeners();
    final Uint8List bytes = await file.readAsBytes();
    final String? url = await _uploadToStorage(bytes, _storagePath('guardian_dni/guardian_dni.jpg'));
    if (url != null) guardianDniImageUrl = url;
    isGuardianDniUploading = false;
    notifyListeners();
  }

  Future<void> uploadSignature(Uint8List bytes) async {
    isSignatureUploading = true;
    notifyListeners();
    final String? url = await _uploadToStorage(bytes, _storagePath('signature/signature.png'));
    onSignatureUploaded(url ?? '');
    isSignatureUploading = false;
    notifyListeners();
  }

  Future<void> submit() async {
    if (!isReadyToSubmit) return;
    setLoading(true);

    final String? memberId = UserManager.instance.user?.uid;
    if (memberId == null) {
      setLoading(false);
      return;
    }

    final String now = DateTime.now().toUtc().toIso8601String();
    final Completer<bool> completer = Completer<bool>();

    if (hasExistingApplication) {
      sl<MemberRepository>().resetMemberApplication(
        memberId: memberId,
        memberName: memberName,
        memberBirthDate: memberBirthDateRaw,
        memberDni: memberDni,
        memberDniImageUrl: memberDniImageUrl!,
        guardianName: guardianName,
        guardianDni: guardianDni,
        guardianDniImageUrl: guardianDniImageUrl,
        signatureUrl: signatureUrl!,
        conditionsAcceptedAt: now,
        minorConditionsAcceptedAt: isMinor ? now : null,
        requestedAt: now,
        onComplete: (dynamic error) => completer.complete(error == null),
      );
    } else {
      sl<MemberRepository>().updateMemberApplication(
        memberId: memberId,
        memberName: memberName,
        memberBirthDate: memberBirthDateRaw,
        memberDni: memberDni,
        memberDniImageUrl: memberDniImageUrl!,
        guardianName: guardianName,
        guardianDni: guardianDni,
        guardianDniImageUrl: guardianDniImageUrl,
        signatureUrl: signatureUrl!,
        conditionsAcceptedAt: now,
        minorConditionsAcceptedAt: isMinor ? now : null,
        requestedAt: now,
        onComplete: (dynamic error) => completer.complete(error == null),
      );
    }

    final bool success = await completer.future;
    setLoading(false);
    if (success) NavigationUtils.showMembershipStatusView(this);
  }

  // Private methods

  void _loadConditions() {
    final String? assocId = SessionDataManager.instance.association?.id;
    if (assocId == null) return;
    sl<AssociationRepository>().getAssociationConditions(
      assocId,
      onComplete: (List<AssociationCondition> conditions, dynamic _) {
        generalConditions = conditions
            .where((AssociationCondition c) => c.type == ConditionType.general)
            .toList();
        minorConditions = conditions
            .where((AssociationCondition c) => c.type == ConditionType.minor)
            .toList();
        notifyListeners();
      },
    );
  }

  String _storagePath(String suffix) {
    final String uid = UserManager.instance.user?.uid ?? 'unknown';
    final String assocId = SessionDataManager.instance.association?.id ?? 'unknown';
    return 'memberships/$assocId/$uid/$suffix';
  }

  Future<String?> _uploadToStorage(Uint8List bytes, String path) async {
    try {
      final Reference ref = FirebaseStorage.instance.ref(path);
      await ref.putData(bytes);
      return await ref.getDownloadURL();
    } catch (e) {
      Log.error('AccessRequestViewModel._uploadToStorage: $e');
      return null;
    }
  }
}
