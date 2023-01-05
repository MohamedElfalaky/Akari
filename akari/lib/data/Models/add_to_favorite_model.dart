import 'package:collection/collection.dart';

class AddToFavoriteModel {
  bool? result;
  String? message;

  AddToFavoriteModel({this.result, this.message});

  factory AddToFavoriteModel.fromJson(Map<String, dynamic> json) {
    return AddToFavoriteModel(
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
    if (other is! AddToFavoriteModel) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => result.hashCode ^ message.hashCode;
}
