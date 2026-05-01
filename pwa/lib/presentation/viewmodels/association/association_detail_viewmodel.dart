import 'dart:async';

import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/repositories/association_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class BandDetailViewModel extends ViewModel {
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

  Band? get band => SessionDataManager.instance.band;

  // Constructor

  BandDetailViewModel();

  @override
  String getScreenName() => 'band_detail';

  @override
  void onStart() {
    super.onStart();
    final Band? b = SessionDataManager.instance.band;
    if (b != null) {
      _requireIdDoc = b.requireIdDoc;
      _requireIdDocImage = b.requireIdDocImage;
      _requireGuardian = b.requireGuardian;
    }
  }

  // Public methods

  Future<void> save() async {
    final String? bandId = band?.id;
    if (bandId == null) return;
    setLoading(true);
    final Completer<void> completer = Completer<void>();
    sl<BandRepository>().updateBand(
      bandId,
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
