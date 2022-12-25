import 'package:collection/collection.dart';

class VarifyOtpModel {
  bool? success;
  int? statusCode;
  String? message;
  List<dynamic>? errors;

  VarifyOtpModel({
    this.success,
    this.statusCode,
    this.message,
    this.errors,
  });

  factory VarifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VarifyOtpModel(
      success: json['success'] as bool?,
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errors: json['errors'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'statusCode': statusCode,
        'message': message,
        'errors': errors,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! VarifyOtpModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      success.hashCode ^
      statusCode.hashCode ^
      message.hashCode ^
      errors.hashCode;
}
