import 'package:collection/collection.dart';

class ForgetPassModel {
  bool? result;
  String? message;

  ForgetPassModel({this.result, this.message});

  factory ForgetPassModel.fromJson(Map<String, dynamic> json) {
    return ForgetPassModel(
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
    if (other is! ForgetPassModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => result.hashCode ^ message.hashCode;
}
