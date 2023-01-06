import 'package:collection/collection.dart';

import 'data.dart';

class Page1Model {
  bool? result;
  String? message;
  Data? data;

  Page1Model({this.result, this.message, this.data});

  factory Page1Model.fromJson(Map<String, dynamic> json) => Page1Model(
        result: json['result'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Page1Model) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => result.hashCode ^ message.hashCode ^ data.hashCode;
}
