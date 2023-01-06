import 'package:collection/collection.dart';

import 'rating.dart';

class Data {
  String? contractType;
  String? buildingType;
  List<dynamic>? unitLaws;
  Rating? rating;
  bool? isActive;
  bool? isSettled;
  List<dynamic>? comments;
  List<dynamic>? amenities;
  String? advertiser;
  int? views;
  String? id;
  List<dynamic>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.contractType,
    this.buildingType,
    this.unitLaws,
    this.rating,
    this.isActive,
    this.isSettled,
    this.comments,
    this.amenities,
    this.advertiser,
    this.views,
    this.id,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        contractType: json['contractType'] as String?,
        buildingType: json['buildingType'] as String?,
        unitLaws: json['unitLaws'] as List<dynamic>?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
        isActive: json['isActive'] as bool?,
        isSettled: json['isSettled'] as bool?,
        comments: json['comments'] as List<dynamic>?,
        amenities: json['amenities'] as List<dynamic>?,
        advertiser: json['advertiser'] as String?,
        views: json['views'] as int?,
        id: json['_id'] as String?,
        images: json['images'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'contractType': contractType,
        'buildingType': buildingType,
        'unitLaws': unitLaws,
        'rating': rating?.toJson(),
        'isActive': isActive,
        'isSettled': isSettled,
        'comments': comments,
        'amenities': amenities,
        'advertiser': advertiser,
        'views': views,
        '_id': id,
        'images': images,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Data) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      contractType.hashCode ^
      buildingType.hashCode ^
      unitLaws.hashCode ^
      rating.hashCode ^
      isActive.hashCode ^
      isSettled.hashCode ^
      comments.hashCode ^
      amenities.hashCode ^
      advertiser.hashCode ^
      views.hashCode ^
      id.hashCode ^
      images.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode;
}
