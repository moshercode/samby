import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:samby/core/di/service_locator.dart';
import 'package:samby/core/utils/log.dart';
import 'package:samby/domain/repositories/event_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class CreateEventViewModel extends ViewModel {
  // Variables

  String title = '';
  String description = '';
  String? imageUrl;
  DateTime? startDate;
  DateTime? endDate;
  bool freeEntry = true;
  String entryCondition = '';
  bool isImageUploading = false;

  bool get isValid =>
      title.trim().isNotEmpty &&
      description.trim().isNotEmpty;

  // Constructor

  CreateEventViewModel();

  @override
  String getScreenName() => 'create_event';

  // Public methods

  void onTitleChanged(String v) {
    title = v;
    notifyListeners();
  }

  void onDescriptionChanged(String v) {
    description = v;
    notifyListeners();
  }

  void onEntryConditionChanged(String v) {
    entryCondition = v;
    notifyListeners();
  }

  void setStartDate(DateTime d) {
    startDate = d;
    notifyListeners();
  }

  void setEndDate(DateTime? d) {
    endDate = d;
    notifyListeners();
  }

  void setFreeEntry(bool v) {
    freeEntry = v;
    if (v) entryCondition = '';
    notifyListeners();
  }

  Future<void> pickAndUploadImage() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) return;
    isImageUploading = true;
    notifyListeners();
    final Uint8List bytes = await file.readAsBytes();
    final String bandId = SessionDataManager.instance.band?.id ?? 'unknown';
    final String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final String? url = await _uploadToStorage(
      bytes,
      'events/$bandId/${timestamp}_cover.jpg',
    );
    if (url != null) imageUrl = url;
    isImageUploading = false;
    notifyListeners();
  }

  Future<void> submit() async {
    if (!isValid) return;
    setLoading(true);

    final String? bandId = SessionDataManager.instance.band?.id;
    final String? userId = UserManager.instance.user?.uid;
    if (bandId == null || userId == null) {
      setLoading(false);
      return;
    }

    final Completer<String?> eventIdCompleter = Completer<String?>();
    sl<EventRepository>().createEvent(
      bandId: bandId,
      title: title.trim(),
      description: description.trim(),
      imageUrl: imageUrl ?? '',
      startDate: startDate?.toUtc().toIso8601String(),
      endDate: endDate?.toUtc().toIso8601String(),
      freeEntry: freeEntry,
      entryCondition: freeEntry || entryCondition.trim().isEmpty ? null : entryCondition.trim(),
      createdBy: userId,
      onComplete: (String? id, dynamic _) => eventIdCompleter.complete(id),
    );

    final String? eventId = await eventIdCompleter.future;
    setLoading(false);
    if (eventId != null) pop();
  }

  // Private methods

  Future<String?> _uploadToStorage(Uint8List bytes, String path) async {
    try {
      final Reference ref = FirebaseStorage.instance.ref(path);
      await ref.putData(bytes);
      return await ref.getDownloadURL();
    } catch (e) {
      Log.error('CreateEventViewModel._uploadToStorage: $e');
      return null;
    }
  }
}
