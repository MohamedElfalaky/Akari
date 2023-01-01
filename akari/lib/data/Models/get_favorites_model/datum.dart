import 'package:collection/collection.dart';

import 'address.dart';
import 'details.dart';
import 'image.dart';
import 'location.dart';
import 'price.dart';
import 'rating.dart';

class Datum {
  String? id;
  String? title;
  List<Image>? images;
  String? description;
  String? contractType;
  String? buildingType;
  Price? price;
  String? paymentOption;
  int? downPaymentPercentage;
  List<dynamic>? unitLaws;
  Rating? rating;
  bool? isActive;
  bool? isSettled;
  Address? address;
  List<dynamic>? comments;
  Location? location;
  Details? details;
  List<dynamic>? amenities;
  String? advertiser;
  String? name;
  String? mobileNumber;
  String? capacity;
  String? contactMethod;
  bool? termsAccepted;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  Datum({
    this.id,
    this.title,
    this.images,
    this.description,
    this.contractType,
    this.buildingType,
    this.price,
    this.paymentOption,
    this.downPaymentPercentage,
    this.unitLaws,
    this.rating,
    this.isActive,
    this.isSettled,
    this.address,
    this.comments,
    this.location,
    this.details,
    this.amenities,
    this.advertiser,
    this.name,
    this.mobileNumber,
    this.capacity,
    this.contactMethod,
    this.termsAccepted,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['_id'] as String?,
        title: json['title'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
        description: json['description'] as String?,
        contractType: json['contractType'] as String?,
        buildingType: json['buildingType'] as String?,
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        paymentOption: json['paymentOption'] as String?,
        downPaymentPercentage: json['downPaymentPercentage'] as int?,
        unitLaws: json['unitLaws'] as List<dynamic>?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
        isActive: json['isActive'] as bool?,
        isSettled: json['isSettled'] as bool?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        comments: json['comments'] as List<dynamic>?,
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        details: json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
        amenities: json['amenities'] as List<dynamic>?,
        advertiser: json['advertiser'] as String?,
        name: json['name'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
        capacity: json['capacity'] as String?,
        contactMethod: json['contactMethod'] as String?,
        termsAccepted: json['termsAccepted'] as bool?,
        v: json['__v'] as int?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'images': images?.map((e) => e.toJson()).toList(),
        'description': description,
        'contractType': contractType,
        'buildingType': buildingType,
        'price': price?.toJson(),
        'paymentOption': paymentOption,
        'downPaymentPercentage': downPaymentPercentage,
        'unitLaws': unitLaws,
        'rating': rating?.toJson(),
        'isActive': isActive,
        'isSettled': isSettled,
        'address': address?.toJson(),
        'comments': comments,
        'location': location?.toJson(),
        'details': details?.toJson(),
        'amenities': amenities,
        'advertiser': advertiser,
        'name': name,
        'mobileNumber': mobileNumber,
        'capacity': capacity,
        'contactMethod': contactMethod,
        'termsAccepted': termsAccepted,
        '__v': v,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
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
      paymentOption.hashCode ^
      downPaymentPercentage.hashCode ^
      unitLaws.hashCode ^
      rating.hashCode ^
      isActive.hashCode ^
      isSettled.hashCode ^
      address.hashCode ^
      comments.hashCode ^
      location.hashCode ^
      details.hashCode ^
      amenities.hashCode ^
      advertiser.hashCode ^
      name.hashCode ^
      mobileNumber.hashCode ^
      capacity.hashCode ^
      contactMethod.hashCode ^
      termsAccepted.hashCode ^
      v.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode;
}
