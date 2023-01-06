import 'package:collection/collection.dart';

import 'details.dart';
import 'rating.dart';

class Data {
  Rating? rating;
  Details? details;
  String? id;
  String? contractType;
  String? buildingType;
  List<dynamic>? unitLaws;
  bool? isActive;
  bool? isSettled;
  List<dynamic>? comments;
  List<dynamic>? amenities;
  String? advertiser;
  int? views;
  List<dynamic>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? title;
  String? description;

  Data({
    this.rating,
    this.details,
    this.id,
    this.contractType,
    this.buildingType,
    this.unitLaws,
    this.isActive,
    this.isSettled,
    this.comments,
    this.amenities,
    this.advertiser,
    this.views,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.title,
    this.description,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
        details: json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
        id: json['_id'] as String?,
        contractType: json['contractType'] as String?,
        buildingType: json['buildingType'] as String?,
        unitLaws: json['unitLaws'] as List<dynamic>?,
        isActive: json['isActive'] as bool?,
        isSettled: json['isSettled'] as bool?,
        comments: json['comments'] as List<dynamic>?,
        amenities: json['amenities'] as List<dynamic>?,
        advertiser: json['advertiser'] as String?,
        views: json['views'] as int?,
        images: json['images'] as List<dynamic>?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'rating': rating?.toJson(),
        'details': details?.toJson(),
        '_id': id,
        'contractType': contractType,
        'buildingType': buildingType,
        'unitLaws': unitLaws,
        'isActive': isActive,
        'isSettled': isSettled,
        'comments': comments,
        'amenities': amenities,
        'advertiser': advertiser,
        'views': views,
        'images': images,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'title': title,
        'description': description,
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
      rating.hashCode ^
      details.hashCode ^
      id.hashCode ^
      contractType.hashCode ^
      buildingType.hashCode ^
      unitLaws.hashCode ^
      isActive.hashCode ^
      isSettled.hashCode ^
      comments.hashCode ^
      amenities.hashCode ^
      advertiser.hashCode ^
      views.hashCode ^
      images.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode ^
      title.hashCode ^
      description.hashCode;
}
