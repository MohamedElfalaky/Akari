import 'package:collection/collection.dart';

class Details {
  int? area;
  int? floors;
  int? roomsCount;
  int? bedroomsCount;
  int? bathroomCount;
  String? deliveryTerm;
  String? renterType;
  String? rentFrequency;

  Details({
    this.area,
    this.floors,
    this.roomsCount,
    this.bedroomsCount,
    this.bathroomCount,
    this.deliveryTerm,
    this.renterType,
    this.rentFrequency,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        area: json['area'] as int?,
        floors: json['floors'] as int?,
        roomsCount: json['roomsCount'] as int?,
        bedroomsCount: json['bedroomsCount'] as int?,
        bathroomCount: json['bathroomCount'] as int?,
        deliveryTerm: json['deliveryTerm'] as String?,
        renterType: json['renterType'] as String?,
        rentFrequency: json['rentFrequency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'area': area,
        'floors': floors,
        'roomsCount': roomsCount,
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
      area.hashCode ^
      floors.hashCode ^
      roomsCount.hashCode ^
      bedroomsCount.hashCode ^
      bathroomCount.hashCode ^
      deliveryTerm.hashCode ^
      renterType.hashCode ^
      rentFrequency.hashCode;
}
