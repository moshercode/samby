import 'package:samby/core/utils/log.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/presentation/managers/pwa_manager.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:flutter/material.dart';

abstract class ViewModel extends ChangeNotifier {
  // Variables

  late BuildContext context;
  bool initialized = false;
  List<String> loadings = <String>[];

  bool get isAppInstalled => PwaManager.instance.isInstalled;
  Band? get band => SessionDataManager.instance.band;

  // Constructor

  ViewModel();

  // Public methods

  @protected
  String getScreenName();

  @mustCallSuper
  void onStart() {
    Log.debug('$runtimeType.onStart()');
    initialized = true;
  }

  @mustCallSuper
  void onResume() {
    Log.debug('$runtimeType.onResume()');
    notifyListeners();
  }

  @mustCallSuper
  void onPause() {
    Log.debug('$runtimeType.onPause()');
  }

  @mustCallSuper
  void onStop() {
    Log.debug('$runtimeType.onStop()');
  }

  void setContext(BuildContext ctx) {
    context = ctx;
  }

  void pop() {
    Navigator.of(context).pop();
  }

  bool isLoading({String key = 'default'}) => loadings.contains(key);

  void setLoading(bool loading, {String key = 'default'}) {
    Log.debug('$runtimeType.setLoading($loading, key: $key)');
    if (loading && !isLoading(key: key)) {
      loadings.add(key);
      notifyListeners();
    } else if (!loading && isLoading(key: key)) {
      loadings.remove(key);
      notifyListeners();
    }
  }
}
