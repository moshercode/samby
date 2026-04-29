import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class RejectedViewModel extends ViewModel {
  // Variables

  bool get isBlocked => SessionDataManager.instance.membership?.isBlocked ?? true;

  // Constructor

  RejectedViewModel();

  @override
  String getScreenName() => 'rejected';

  // Public methods

  void reapply() {
    SessionDataManager.instance.clearMembership();
    NavigationUtils.showAccessRequestView(this);
  }
}
