import 'package:collection/collection.dart';

class Data {
  String? id;
  String? email;
  String? name;
  List<dynamic>? roles;
  String? phone;
  String? currency;
  String? language;
  bool? isVerified;
  List<dynamic>? favorite;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? rooms;
  int? numberOfCalls;
  bool? tempPassword;
  String? about;

  Data({
    this.id,
    this.email,
    this.name,
    this.roles,
    this.phone,
    this.currency,
    this.language,
    this.isVerified,
    this.favorite,
    this.createdAt,
    this.updatedAt,
    this.rooms,
    this.numberOfCalls,
    this.tempPassword,
    this.about,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['_id'] as String?,
        email: json['email'] as String?,
        name: json['name'] as String?,
        roles: json['roles'] as List<dynamic>?,
        phone: json['phone'] as String?,
        currency: json['currency'] as String?,
        language: json['language'] as String?,
        isVerified: json['isVerified'] as bool?,
        favorite: json['favorite'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        rooms: json['rooms'] as List<dynamic>?,
        numberOfCalls: json['numberOfCalls'] as int?,
        tempPassword: json['tempPassword'] as bool?,
        about: json['about'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'name': name,
        'roles': roles,
        'phone': phone,
        'currency': currency,
        'language': language,
        'isVerified': isVerified,
        'favorite': favorite,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'rooms': rooms,
        'numberOfCalls': numberOfCalls,
        'tempPassword': tempPassword,
        'about': about,
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
      roles.hashCode ^
      phone.hashCode ^
      currency.hashCode ^
      language.hashCode ^
      isVerified.hashCode ^
      favorite.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      rooms.hashCode ^
      numberOfCalls.hashCode ^
      tempPassword.hashCode ^
      about.hashCode;
}
