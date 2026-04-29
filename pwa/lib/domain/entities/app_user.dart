import 'package:samby/domain/entities/entity.dart';

class AppUser implements Entity {
  // Variables

  late String id;
  late String email;
  late String name;
  late String phone;

  // Constructor

  @override
  AppUser.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    email = map['email'] as String;
    name = map['name'] as String;
    phone = map['phone'] as String;
  }
}
