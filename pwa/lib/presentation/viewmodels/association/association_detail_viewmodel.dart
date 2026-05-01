import 'dart:async';

import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class AssociationDetailViewModel extends ViewModel {
  // Variables

  bool _requireIdDoc = false;
  bool _requireIdDocImage = false;
  bool _requireGuardian = false;
  bool _saved = false;

  bool get requireIdDoc => _requireIdDoc;
  set requireIdDoc(bool v) { _requireIdDoc = v; _saved = false; notifyListeners(); }

  bool get requireIdDocImage => _requireIdDocImage;
  set requireIdDocImage(bool v) { _requireIdDocImage = v; _saved = false; notifyListeners(); }

  bool get requireGuardian => _requireGuardian;
  set requireGuardian(bool v) { _requireGuardian = v; _saved = false; notifyListeners(); }

  bool get saved => _saved;

  Association? get association => SessionDataManager.instance.association;

  // Constructor

  AssociationDetailViewModel();

  @override
  String getScreenName() => 'association_detail';

  @override
  void onStart() {
    super.onStart();
    final Association? assoc = SessionDataManager.instance.association;
    if (assoc != null) {
      _requireIdDoc = assoc.requireIdDoc;
      _requireIdDocImage = assoc.requireIdDocImage;
      _requireGuardian = assoc.requireGuardian;
    }
  }

  // Public methods

  Future<void> save() async {
    final String? assocId = association?.id;
    if (assocId == null) return;
    setLoading(true);
    final Completer<void> completer = Completer<void>();
    sl<AssociationRepository>().updateAssociation(
      assocId,
      requireIdDoc: _requireIdDoc,
      requireIdDocImage: _requireIdDocImage,
      requireGuardian: _requireGuardian,
      onComplete: (_) => completer.complete(),
    );
    await completer.future;
    _saved = true;
    setLoading(false);
  }
}
