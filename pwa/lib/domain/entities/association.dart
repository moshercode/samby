import 'package:samby/domain/entities/entity.dart';

class Band implements Entity {
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
  late bool requireIdDoc;
  late bool requireIdDocImage;
  late bool requireGuardian;
  late bool active;

  // Constructor

  @override
  Band.fromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    name = map['name'] as String;
    shortName = map['shortName'] as String;
    subdomain = map['subdomain'] as String;
    logoUrl = map['logoUrl'] as String;
    iconUrl = map['iconUrl'] as String;
    primaryColor = map['primaryColor'] as String;
    secondaryColor = map['secondaryColor'] as String;
    founderEmail = map['founderEmail'] as String? ?? '';
    requireIdDoc = map['requireIdDoc'] as bool? ?? false;
    requireIdDocImage = map['requireIdDocImage'] as bool? ?? false;
    requireGuardian = map['requireGuardian'] as bool? ?? false;
    active = map['active'] as bool? ?? false;
  }
}
