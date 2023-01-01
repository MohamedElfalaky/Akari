import 'package:collection/collection.dart';

import 'address.dart';
import 'comfort_ways.dart';
import 'location.dart';
import 'rating.dart';
import 'rooms_and_beds.dart';

class Datum {
  String? id;
  String? title;
  List<dynamic>? images;
  String? description;
  String? contractType;
  String? buildingType;
  int? price;
  List<dynamic>? unitLaws;
  Rating? rating;
  bool? isActive;
  Address? address;
  Location? location;
  RoomsAndBeds? roomsAndBeds;
  ComfortWays? comfortWays;
  String? advisor;
  int? v;
  DateTime? createdAt;

  Datum({
    this.id,
    this.title,
    this.images,
    this.description,
    this.contractType,
    this.buildingType,
    this.price,
    this.unitLaws,
    this.rating,
    this.isActive,
    this.address,
    this.location,
    this.roomsAndBeds,
    this.comfortWays,
    this.advisor,
    this.v,
    this.createdAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        images: json['images'] as List<dynamic>?,
        description: json['description'] as String?,
        contractType: json['contractType'] as String?,
        buildingType: json['buildingType'] as String?,
        price: json['price'] as int?,
        unitLaws: json['unitLaws'] as List<dynamic>?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
        isActive: json['isActive'] as bool?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        roomsAndBeds: json['roomsAndBeds'] == null
            ? null
            : RoomsAndBeds.fromJson(
                json['roomsAndBeds'] as Map<String, dynamic>),
        comfortWays: json['comfortWays'] == null
            ? null
            : ComfortWays.fromJson(json['comfortWays'] as Map<String, dynamic>),
        advisor: json['advisor'] as String?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'images': images,
        'description': description,
        'contractType': contractType,
        'buildingType': buildingType,
        'price': price,
        'unitLaws': unitLaws,
        'rating': rating?.toJson(),
        'isActive': isActive,
        'address': address?.toJson(),
        'location': location?.toJson(),
        'roomsAndBeds': roomsAndBeds?.toJson(),
        'comfortWays': comfortWays?.toJson(),
        'advisor': advisor,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Datum) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      images.hashCode ^
      description.hashCode ^
      contractType.hashCode ^
      buildingType.hashCode ^
      price.hashCode ^
      unitLaws.hashCode ^
      rating.hashCode ^
      isActive.hashCode ^
      address.hashCode ^
      location.hashCode ^
      roomsAndBeds.hashCode ^
      comfortWays.hashCode ^
      advisor.hashCode ^
      v.hashCode ^
      createdAt.hashCode;
}
