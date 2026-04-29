import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samby/core/di/service_locator.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/domain/entities/app_user.dart';
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
  String memberDNI = '';
  String? memberDNIImageUrl;
  String? guardianName;
  String? guardianDNI;
  String? guardianDNIImageUrl;
  String? signatureUrl;

  bool isDNIUploading = false;
  bool isGuardianDNIUploading = false;
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
    final bool signatureValid = signatureUrl != null && signatureUrl!.isNotEmpty;
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
    signatureUrl = url.isEmpty ? null : url;
    notifyListeners();
  }

  Future<void> pickAndUploadMemberDNI() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    isDNIUploading = true;
    notifyListeners();
    final Uint8List bytes = await file.readAsBytes();
    final String? url = await _uploadToStorage(bytes, _dniPath('dni/dni.jpg'));
    if (url != null) memberDNIImageUrl = url;
    isDNIUploading = false;
    notifyListeners();
  }

  Future<void> pickAndUploadGuardianDNI() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    isGuardianDNIUploading = true;
    notifyListeners();
    final Uint8List bytes = await file.readAsBytes();
    final String? url = await _uploadToStorage(bytes, _dniPath('guardian_dni/guardian_dni.jpg'));
    if (url != null) guardianDNIImageUrl = url;
    isGuardianDNIUploading = false;
    notifyListeners();
  }

  Future<void> uploadSignature(Uint8List bytes) async {
    isSignatureUploading = true;
    notifyListeners();
    final String? url = await _uploadToStorage(bytes, _dniPath('signature/signature.png'));
    onSignatureUploaded(url ?? '');
    isSignatureUploading = false;
    notifyListeners();
  }

  Future<void> submit() async {
    if (!isReadyToSubmit) return;
    setLoading(true);

    final String? email = UserManager.instance.userEmail;
    final String? assocId = SessionDataManager.instance.association?.id;
    if (email == null || assocId == null) {
      setLoading(false);
      return;
    }

    // Get or create AppUser
    final Completer<String?> userCompleter = Completer<String?>();
    sl<MembershipRepository>().getUserByEmail(email, onComplete: (AppUser? user, dynamic _) {
      if (user != null) {
        userCompleter.complete(user.id);
      } else {
        sl<MembershipRepository>().createAppUser(
          email, memberName, '',
          onComplete: (String? id, dynamic __) => userCompleter.complete(id),
        );
      }
    });

    final String? userId = await userCompleter.future;
    if (userId == null) {
      setLoading(false);
      return;
    }

    final String now = DateTime.now().toIso8601String();
    final Completer<bool> submitCompleter = Completer<bool>();

    if (hasExistingMembership) {
      sl<MembershipRepository>().resetMembership(
        assocId, userId,
        onComplete: (dynamic error) => submitCompleter.complete(error == null),
      );
    } else {
      sl<MembershipRepository>().createMembership(
        associationId: assocId,
        userId: userId,
        memberName: memberName,
        memberBirthDate: memberBirthDateRaw,
        memberDNI: memberDNI,
        memberDNIImageUrl: memberDNIImageUrl!,
        guardianName: guardianName,
        guardianDNI: guardianDNI,
        guardianDNIImageUrl: guardianDNIImageUrl,
        signatureUrl: signatureUrl!,
        conditionsAcceptedAt: now,
        minorConditionsAcceptedAt: isMinor ? now : null,
        onComplete: (dynamic error) => submitCompleter.complete(error == null),
      );
    }

    final bool success = await submitCompleter.future;
    setLoading(false);
    if (success) NavigationUtils.showPendingApprovalView(this);
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

  String _dniPath(String suffix) {
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
