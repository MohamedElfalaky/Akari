import 'package:collection/collection.dart';

class Address {
  String? state;
  String? id;

  Address({this.state, this.id});

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json['state'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'state': state,
        '_id': id,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Address) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => state.hashCode ^ id.hashCode;
}
