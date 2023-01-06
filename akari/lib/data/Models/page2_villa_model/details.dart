import 'package:collection/collection.dart';

class Details {
  String? subType;
  int? area;
  int? bedroomsCount;
  int? bathroomCount;
  String? deliveryTerm;
  DateTime? deliveryDate;
  String? renterType;
  String? rentFrequency;

  Details({
    this.subType,
    this.area,
    this.bedroomsCount,
    this.bathroomCount,
    this.deliveryTerm,
    this.deliveryDate,
    this.renterType,
    this.rentFrequency,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        subType: json['subType'] as String?,
        area: json['area'] as int?,
        bedroomsCount: json['bedroomsCount'] as int?,
        bathroomCount: json['bathroomCount'] as int?,
        deliveryTerm: json['deliveryTerm'] as String?,
        deliveryDate: json['deliveryDate'] == null
            ? null
            : DateTime.parse(json['deliveryDate'] as String),
        renterType: json['renterType'] as String?,
        rentFrequency: json['rentFrequency'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'subType': subType,
        'area': area,
        'bedroomsCount': bedroomsCount,
        'bathroomCount': bathroomCount,
        'deliveryTerm': deliveryTerm,
        'deliveryDate': deliveryDate?.toIso8601String(),
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
      deliveryDate.hashCode ^
      renterType.hashCode ^
      rentFrequency.hashCode;
}
