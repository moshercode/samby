import 'package:samby/core/utils/log.dart';

abstract class Entity {
  Entity.fromMap(Map<String, dynamic> map) {
    Log.debug('Initializing $runtimeType with map: $map');
  }
}
