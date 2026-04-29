import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class DashboardViewModel extends ViewModel {
  // Variables

  bool get isManager => SessionDataManager.instance.membership?.isManager ?? false;
  Membership? get membership => SessionDataManager.instance.membership;

  // Constructor

  DashboardViewModel();

  @override
  String getScreenName() => 'dashboard';

  @override
  void onStart() {
    super.onStart();
  }
}
