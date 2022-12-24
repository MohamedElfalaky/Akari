import 'package:collection/collection.dart';

class Data {
  String? id;
  String? email;
  String? name;
  String? phone;
  List<String>? roles;

  Data({this.id, this.email, this.name, this.phone, this.roles});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as String?,
        email: json['email'] as String?,
        name: json['name'] as String?,
        phone: json['phone'] as String?,
        roles: json['roles'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'roles': roles,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      email.hashCode ^
      name.hashCode ^
      phone.hashCode ^
      roles.hashCode;
}
