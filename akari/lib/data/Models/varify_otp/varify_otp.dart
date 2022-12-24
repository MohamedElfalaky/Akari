import 'package:collection/collection.dart';

import 'data.dart';

class VarifyOtpModel {
  bool? result;
  String? message;
  Data? data;
  String? accessToken;

  VarifyOtpModel({this.result, this.message, this.data, this.accessToken});

  factory VarifyOtpModel.fromJson(Map<String, dynamic> json) => VarifyOtpModel(
        result: json['result'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        accessToken: json['accessToken'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
        'data': data?.toJson(),
        'accessToken': accessToken,
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
      result.hashCode ^ message.hashCode ^ data.hashCode ^ accessToken.hashCode;
}
