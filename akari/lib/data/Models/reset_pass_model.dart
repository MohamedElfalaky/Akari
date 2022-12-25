import 'package:collection/collection.dart';

class ResetPassModel {
  bool? result;
  String? message;

  ResetPassModel({this.result, this.message});

  factory ResetPassModel.fromJson(Map<String, dynamic> json) {
    return ResetPassModel(
      result: json['result'] as bool?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResetPassModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => result.hashCode ^ message.hashCode;
}
