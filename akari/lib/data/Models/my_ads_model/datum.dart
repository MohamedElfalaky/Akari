import 'package:collection/collection.dart';

import 'address.dart';
import 'details.dart';
import 'price.dart';
import 'rating.dart';

class Datum {
  String? id;
  String? contractType;
  String? buildingType;
  Rating? rating;
  bool? isActive;
  bool? isSettled;
  List<dynamic>? comments;
  Details? details;
  List<dynamic>? amenities;
  String? advertiser;
  int? views;
  List<dynamic>? images;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? description;
  String? title;
  Address? address;
  bool? isNegotiable;
  bool? onlyAcceptUsd;
  String? paymentOption;
  Price? price;
  String? capacity;
  String? contactMethod;
  String? mobileNumber;
  String? name;
  bool? termsAccepted;

  Datum({
    this.id,
    this.contractType,
    this.buildingType,
    this.rating,
    this.isActive,
    this.isSettled,
    this.comments,
    this.details,
    this.amenities,
    this.advertiser,
    this.views,
    this.images,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.description,
    this.title,
    this.address,
    this.isNegotiable,
    this.onlyAcceptUsd,
    this.paymentOption,
    this.price,
    this.capacity,
    this.contactMethod,
    this.mobileNumber,
    this.name,
    this.termsAccepted,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['_id'] as String?,
        contractType: json['contractType'] as String?,
        buildingType: json['buildingType'] as String?,
        rating: json['rating'] == null
            ? null
            : Rating.fromJson(json['rating'] as Map<String, dynamic>),
        isActive: json['isActive'] as bool?,
        isSettled: json['isSettled'] as bool?,
        comments: json['comments'] as List<dynamic>?,
        details: json['details'] == null
            ? null
            : Details.fromJson(json['details'] as Map<String, dynamic>),
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
        description: json['description'] as String?,
        title: json['title'] as String?,
        address: json['address'] == null
            ? null
            : Address.fromJson(json['address'] as Map<String, dynamic>),
        isNegotiable: json['isNegotiable'] as bool?,
        onlyAcceptUsd: json['onlyAcceptUSD'] as bool?,
        paymentOption: json['paymentOption'] as String?,
        price: json['price'] == null
            ? null
            : Price.fromJson(json['price'] as Map<String, dynamic>),
        capacity: json['capacity'] as String?,
        contactMethod: json['contactMethod'] as String?,
        mobileNumber: json['mobileNumber'] as String?,
        name: json['name'] as String?,
        termsAccepted: json['termsAccepted'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'contractType': contractType,
        'buildingType': buildingType,
        'rating': rating?.toJson(),
        'isActive': isActive,
        'isSettled': isSettled,
        'comments': comments,
        'details': details?.toJson(),
        'amenities': amenities,
        'advertiser': advertiser,
        'views': views,
        'images': images,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'description': description,
        'title': title,
        'address': address?.toJson(),
        'isNegotiable': isNegotiable,
        'onlyAcceptUSD': onlyAcceptUsd,
        'paymentOption': paymentOption,
        'price': price?.toJson(),
        'capacity': capacity,
        'contactMethod': contactMethod,
        'mobileNumber': mobileNumber,
        'name': name,
        'termsAccepted': termsAccepted,
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
      contractType.hashCode ^
      buildingType.hashCode ^
      rating.hashCode ^
      isActive.hashCode ^
      isSettled.hashCode ^
      comments.hashCode ^
      details.hashCode ^
      amenities.hashCode ^
      advertiser.hashCode ^
      views.hashCode ^
      images.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      v.hashCode ^
      description.hashCode ^
      title.hashCode ^
      address.hashCode ^
      isNegotiable.hashCode ^
      onlyAcceptUsd.hashCode ^
      paymentOption.hashCode ^
      price.hashCode ^
      capacity.hashCode ^
      contactMethod.hashCode ^
      mobileNumber.hashCode ^
      name.hashCode ^
      termsAccepted.hashCode;
}
