import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class MembersViewModel extends ViewModel {
  // Variables

  List<Member> members = <Member>[];

  // Constructor

  MembersViewModel();

  @override
  String getScreenName() => 'members';

  @override
  void onStart() {
    super.onStart();
    _loadMembers();
  }

  // Private methods

  void _loadMembers() {
    final String? assocId = SessionDataManager.instance.association?.id;
    if (assocId == null) return;
    setLoading(true);
    sl<MemberRepository>().getAssociationMembers(
      assocId,
      onComplete: (List<Member> result, dynamic _) {
        members = result;
        setLoading(false);
      },
    );
  }
}
