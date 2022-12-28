import 'package:collection/collection.dart';

import 'datum.dart';

class GetMassageModel {
  bool? result;
  String? message;
  List<Datum>? data;

  GetMassageModel({this.result, this.message, this.data});

  factory GetMassageModel.fromJson(Map<String, dynamic> json) {
    return GetMassageModel(
      result: json['result'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! GetMassageModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => result.hashCode ^ message.hashCode ^ data.hashCode;
}
