import 'package:collection/collection.dart';

class Details {
  String? subType;
  int? area;
  int? bedroomsCount;
  int? bathroomCount;
  String? deliveryTerm;
  String? renterType;
  List<dynamic>? rentFrequency;

  Details({
    this.subType,
    this.area,
    this.bedroomsCount,
    this.bathroomCount,
    this.deliveryTerm,
    this.renterType,
    this.rentFrequency,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        subType: json['subType'] as String?,
        area: json['area'] as int?,
        bedroomsCount: json['bedroomsCount'] as int?,
        bathroomCount: json['bathroomCount'] as int?,
        deliveryTerm: json['deliveryTerm'] as String?,
        renterType: json['renterType'] as String?,
        rentFrequency: json['rentFrequency'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'subType': subType,
        'area': area,
        'bedroomsCount': bedroomsCount,
        'bathroomCount': bathroomCount,
        'deliveryTerm': deliveryTerm,
        'renterType': renterType,
        'rentFrequency': rentFrequency,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Details) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      subType.hashCode ^
      area.hashCode ^
      bedroomsCount.hashCode ^
      bathroomCount.hashCode ^
      deliveryTerm.hashCode ^
      renterType.hashCode ^
      rentFrequency.hashCode;
}
