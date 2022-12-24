import 'package:collection/collection.dart';

class Otp {
  int? code;
  int? expiresAt;

  Otp({this.code, this.expiresAt});

  factory Otp.fromJson(Map<String, dynamic> json) => Otp(
        code: json['code'] as int?,
        expiresAt: json['expiresAt'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'code': code,
        'expiresAt': expiresAt,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Otp) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => code.hashCode ^ expiresAt.hashCode;
}
