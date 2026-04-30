import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class ProfileViewModel extends ViewModel {
  // Variables

  Member? get member => SessionDataManager.instance.member;

  // Constructor

  ProfileViewModel();

  @override
  String getScreenName() => 'profile';

  // Public methods

  Future<void> logout() async {
    await UserManager.instance.logOut();
    SessionDataManager.instance.clear();
    pop();
  }
}
