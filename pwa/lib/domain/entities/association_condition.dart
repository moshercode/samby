import 'package:samby/domain/entities/entity.dart';

enum ConditionType { general, minor }

class AssociationCondition implements Entity {
  // Variables

  late String id;
  late ConditionType type;
  late String content;
  late int sortOrder;

  // Constructor

  @override
  AssociationCondition.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    type = map['type'] == 'minor' ? ConditionType.minor : ConditionType.general;
    content = map['content'] as String;
    sortOrder = map['sortOrder'] as int? ?? 0;
  }
}
