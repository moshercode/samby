import 'dart:async';

import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/event_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class MemberDetailViewModel extends ViewModel {
  // Variables

  final Member member;
  List<Event> events = <Event>[];
  bool isRoleLoading = false;

  bool get canChangeRole =>
      (SessionDataManager.instance.member?.isManager ?? false) &&
      !member.isFounder;

  // Constructor

  MemberDetailViewModel(this.member);

  @override
  String getScreenName() => 'member_detail';

  @override
  void onStart() {
    super.onStart();
    _loadEvents();
  }

  // Public methods

  Future<void> updateRole(MemberRole newRole) async {
    if (!canChangeRole || newRole == member.role) return;
    isRoleLoading = true;
    notifyListeners();

    final Completer<bool> completer = Completer<bool>();
    sl<MemberRepository>().updateMemberRole(
      member.id,
      newRole.name,
      onComplete: (dynamic error) => completer.complete(error == null),
    );

    final bool success = await completer.future;
    if (success) {
      member.role = newRole;
    }
    isRoleLoading = false;
    notifyListeners();
  }

  // Private methods

  void _loadEvents() {
    setLoading(true);
    sl<EventRepository>().getMemberEvents(
      member.id,
      onComplete: (List<Event> result, dynamic _) {
        events = result;
        setLoading(false);
      },
    );
  }
}
