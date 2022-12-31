import 'package:collection/collection.dart';

class RoomsAndBeds {
  int? area;
  int? floors;
  int? roomsCount;
  int? bedsCount;
  int? bathroomCount;

  RoomsAndBeds({
    this.area,
    this.floors,
    this.roomsCount,
    this.bedsCount,
    this.bathroomCount,
  });

  factory RoomsAndBeds.fromJson(Map<String, dynamic> json) => RoomsAndBeds(
        area: json['area'] as int?,
        floors: json['floors'] as int?,
        roomsCount: json['roomsCount'] as int?,
        bedsCount: json['bedsCount'] as int?,
        bathroomCount: json['bathroomCount'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'area': area,
        'floors': floors,
        'roomsCount': roomsCount,
        'bedsCount': bedsCount,
        'bathroomCount': bathroomCount,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! RoomsAndBeds) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      area.hashCode ^
      floors.hashCode ^
      roomsCount.hashCode ^
      bedsCount.hashCode ^
      bathroomCount.hashCode;
}
