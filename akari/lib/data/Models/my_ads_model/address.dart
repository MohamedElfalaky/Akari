import 'package:collection/collection.dart';

class Address {
  String? state;
  String? district;
  String? detailedAddress;
  String? poBox;
  String? id;

  Address({
    this.state,
    this.district,
    this.detailedAddress,
    this.poBox,
    this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        state: json['state'] as String?,
        district: json['district'] as String?,
        detailedAddress: json['detailedAddress'] as String?,
        poBox: json['POBox'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'state': state,
        'district': district,
        'detailedAddress': detailedAddress,
        'POBox': poBox,
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
  int get hashCode =>
      state.hashCode ^
      district.hashCode ^
      detailedAddress.hashCode ^
      poBox.hashCode ^
      id.hashCode;
}
