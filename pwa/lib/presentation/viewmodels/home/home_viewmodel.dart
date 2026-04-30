import 'package:samby/core/di/service_locator.dart';
import 'package:samby/domain/entities/association.dart';
import 'package:samby/domain/entities/event.dart';
import 'package:samby/domain/entities/membership.dart';
import 'package:samby/domain/repositories/event_repository.dart';
import 'package:samby/domain/repositories/membership_repository.dart';
import 'package:samby/presentation/managers/session_data_manager.dart';
import 'package:samby/presentation/managers/user_manager.dart';
import 'package:samby/presentation/viewmodels/base/view_model.dart';

class HomeViewModel extends ViewModel {
  // Variables

  int _tabIndex = 0;
  List<Event> _allEvents = <Event>[];
  List<Member> _members = <Member>[];
  bool _membersLoaded = false;

  int get tabIndex => _tabIndex;
  bool get isManager => SessionDataManager.instance.member?.isManager ?? false;
  Member? get currentMember => SessionDataManager.instance.member;
  Association? get association => SessionDataManager.instance.association;

  List<int> get tabIndices {
    if (isManager) return <int>[0, 1, 2, 3];
    return <int>[0, 1];
  }

  int get membersTabIndex => isManager ? 1 : -1;
  int get associationTabIndex => isManager ? 2 : -1;
  int get profileTabIndex => isManager ? 3 : 1;

  List<Event> get activeEvents {
    final List<Event> visible = _allEvents.where((Event e) => e.isActive).toList();
    if (isManager) return visible;
    final String? memberId = currentMember?.id;
    return visible.where((Event e) => e.freeEntry || e.hasAccessFor(memberId)).toList();
  }

  List<Event> get finishedEvents => isManager
      ? _allEvents.where((Event e) => e.isFinished || e.isCancelled).toList()
      : <Event>[];

  List<Member> get members => _members;

  // Constructor

  HomeViewModel();

  @override
  String getScreenName() => 'home';

  @override
  void onStart() {
    super.onStart();
    _loadEvents();
  }

  @override
  void onResume() {
    super.onResume();
    _loadEvents();
  }

  // Public methods

  void setTab(int index) {
    _tabIndex = index;
    if (isManager && index == membersTabIndex && !_membersLoaded) {
      _loadMembers();
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await UserManager.instance.logOut();
    SessionDataManager.instance.clear();
    pop();
  }

  // Private methods

  void _loadEvents() {
    final String? assocId = SessionDataManager.instance.association?.id;
    if (assocId == null) return;
    sl<EventRepository>().getAssociationEvents(
      assocId,
      onComplete: (List<Event> events, dynamic _) {
        _allEvents = events;
        notifyListeners();
      },
    );
  }

  void _loadMembers() {
    final String? assocId = SessionDataManager.instance.association?.id;
    if (assocId == null) return;
    sl<MemberRepository>().getAssociationMembers(
      assocId,
      onComplete: (List<Member> members, dynamic _) {
        _members = members;
        _membersLoaded = true;
        notifyListeners();
      },
    );
  }
}
