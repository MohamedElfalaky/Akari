import 'package:collection/collection.dart';

import 'data.dart';

class GetUserDataModel {
  bool? result;
  String? message;
  Data? data;

  GetUserDataModel({this.result, this.message, this.data});

  factory GetUserDataModel.fromJson(Map<String, dynamic> json) {
    return GetUserDataModel(
      result: json['result'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GetUserDataModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => result.hashCode ^ message.hashCode ^ data.hashCode;
}
