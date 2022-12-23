import 'package:collection/collection.dart';

import 'otp.dart';

class Data {
  String? email;
  String? name;
  String? password;
  List<dynamic>? roles;
  String? phone;
  Otp? otp;
  String? currency;
  String? language;
  bool? isVerified;
  dynamic udf1;
  List<dynamic>? favorite;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.email,
    this.name,
    this.password,
    this.roles,
    this.phone,
    this.otp,
    this.currency,
    this.language,
    this.isVerified,
    this.udf1,
    this.favorite,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        email: json['email'] as String?,
        name: json['name'] as String?,
        password: json['password'] as String?,
        roles: json['roles'] as List<dynamic>?,
        phone: json['phone'] as String?,
        otp: json['otp'] == null
            ? null
            : Otp.fromJson(json['otp'] as Map<String, dynamic>),
        currency: json['currency'] as String?,
        language: json['language'] as String?,
        isVerified: json['isVerified'] as bool?,
        udf1: json['udf1'] as dynamic,
        favorite: json['favorite'] as List<dynamic>?,
        id: json['_id'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'password': password,
        'roles': roles,
        'phone': phone,
        'otp': otp?.toJson(),
        'currency': currency,
        'language': language,
        'isVerified': isVerified,
        'udf1': udf1,
        'favorite': favorite,
        '_id': id,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
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
      email.hashCode ^
      name.hashCode ^
      password.hashCode ^
      roles.hashCode ^
      phone.hashCode ^
      otp.hashCode ^
      currency.hashCode ^
      language.hashCode ^
      isVerified.hashCode ^
      udf1.hashCode ^
      favorite.hashCode ^
      id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode;
}
