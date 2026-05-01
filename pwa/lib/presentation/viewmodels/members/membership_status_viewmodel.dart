import 'dart:async';

import 'package:samby/domain/entities/membership.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/utils/navigation_utils.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class MembershipStatusViewModel extends ViewModel {
  // Variables

  Member? get member => SessionDataManager.instance.member;

  bool get isPending => member?.status == MemberStatus.pending;
  bool get isRejected => member?.status == MemberStatus.rejected;
  bool get isBlocked => member?.isBlocked ?? false;
  bool get canReapply => isRejected && !isBlocked;

  // Constructor

  MembershipStatusViewModel();

  @override
  String getScreenName() => 'membership_status';

  // Public methods

  void reapply() {
    NavigationUtils.showAccessRequestView(this);
  }

  Future<void> logout() async {
    await UserManager.instance.logOut();
    SessionDataManager.instance.clear();
    pop();
  }

  Future<void> checkStatus() async {
    final String? memberId = UserManager.instance.user?.uid;
    if (memberId == null) return;
    setLoading(true);
    final Completer<void> completer = Completer<void>();
    SessionDataManager.instance.loadMember(memberId, onComplete: completer.complete);
    await completer.future;
    setLoading(false);
    final Member? updated = SessionDataManager.instance.member;
    if (updated?.status == MemberStatus.approved) {
      NavigationUtils.showHomeView(this);
    } else {
      notifyListeners();
    }
  }
}
