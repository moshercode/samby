import 'package:samby/domain/entities/entity.dart';

class Association implements Entity {
  // Variables

  late String id;
  late String name;
  late String shortName;
  late String subdomain;
  late String logoUrl;
  late String iconUrl;
  late String primaryColor;
  late String secondaryColor;
  late String founderEmail;
  late bool requireDni;
  late bool requireDniImage;
  late bool requireGuardian;
  late bool active;

  // Constructor

  @override
  Association.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    name = map['name'] as String;
    shortName = map['shortName'] as String;
    subdomain = map['subdomain'] as String;
    logoUrl = map['logoUrl'] as String;
    iconUrl = map['iconUrl'] as String;
    primaryColor = map['primaryColor'] as String;
    secondaryColor = map['secondaryColor'] as String;
    founderEmail = map['founderEmail'] as String? ?? '';
    requireDni = map['requireDni'] as bool? ?? false;
    requireDniImage = map['requireDniImage'] as bool? ?? false;
    requireGuardian = map['requireGuardian'] as bool? ?? false;
    active = map['active'] as bool? ?? false;
  }
}
