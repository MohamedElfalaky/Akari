import 'package:collection/collection.dart';

import 'datum.dart';

class AllAddsModel {
  List<Datum>? data;
  String? message;
  bool? result;

  AllAddsModel({this.data, this.message, this.result});

  factory AllAddsModel.fromJson(Map<String, dynamic> json) => AllAddsModel(
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
            .toList(),
        message: json['message'] as String?,
        result: json['result'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'data': data?.map((e) => e.toJson()).toList(),
        'message': message,
        'result': result,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! AllAddsModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => data.hashCode ^ message.hashCode ^ result.hashCode;
}
