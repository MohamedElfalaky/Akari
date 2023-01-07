class AllAddsModel {
  AllAddsModel({
    required this.result,
    required this.message,
    required this.data,
  });
  late final bool result;
  late final String message;
  late final List<Data> data;

  AllAddsModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.images,
    required this.description,
    required this.contractType,
    required this.buildingType,
    required this.price,
    required this.paymentOption,
    required this.downPaymentPercentage,
    required this.unitLaws,
    required this.rating,
    required this.isActive,
    required this.isSettled,
    required this.address,
    required this.location,
    required this.details,
    required this.amenities,
    required this.advertiser,
    required this.name,
    required this.mobileNumber,
    required this.capacity,
    required this.contactMethod,
    required this.termsAccepted,
    required this.V,
    required this.createdAt,
  });
  late final String id;
  late final String title;
  late final List<Images> images;
  late final String description;
  late final String contractType;
  late final String buildingType;
  late final Price price;
  late final String paymentOption;
  late final int? downPaymentPercentage;
  late final List<String> unitLaws;
  late final Rating rating;
  late final bool isActive;
  late final bool isSettled;
  late final Address address;
  late final Location? location;
  late final Details details;
  late final List<String> amenities;
  late final String advertiser;
  late final String name;
  late final String mobileNumber;
  late final String capacity;
  late final String contactMethod;
  late final bool termsAccepted;
  late final int V;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    images = List.from(json['images']).map((e) => Images.fromJson(e)).toList();
    description = json['description'];
    contractType = json['contractType'];
    buildingType = json['buildingType'];
    price = Price.fromJson(json['price']);
    paymentOption = json['paymentOption'];
    downPaymentPercentage = json['downPaymentPercentage'];
    unitLaws = List.castFrom<dynamic, String>(json['unitLaws']);
    rating = Rating.fromJson(json['rating']);
    isActive = json['isActive'];
    isSettled = json['isSettled'];
    address = Address.fromJson(json['address']);
    location = Location.fromJson(json['location'] ?? {"": ""});
    details = Details.fromJson(json['details']);
    amenities = List.castFrom<dynamic, String>(json['amenities']);
    advertiser = json['advertiser'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
    capacity = json['capacity'];
    contactMethod = json['contactMethod'];
    termsAccepted = json['termsAccepted'];
    V = json['__v'];
    createdAt = json['createdAt'];
  }
}

class Images {
  Images({
    required this.id,
    required this.normal,
    required this.small,
  });
  late final String id;
  late final String normal;
  late final String small;

  Images.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    normal = json['normal'];
    small = json['small'];
  }
}

class Price {
  Price({
    required this.inUSD,
    required this.inSP,
    required this.id,
  });
  late final int inUSD;
  late final int inSP;
  late final String id;

  Price.fromJson(Map<String, dynamic> json) {
    inUSD = json['inUSD'];
    inSP = json['inSP'];
    id = json['_id'];
  }
}

class Rating {
  Rating({
    this.result,
    required this.count,
    required this.all,
  });
  late final Null result;
  late final int count;
  late final List<dynamic> all;

  Rating.fromJson(Map<String, dynamic> json) {
    result = null;
    count = json['count'];
    all = List.castFrom<dynamic, dynamic>(json['all']);
  }
}

class Address {
  Address({
    required this.state,
    required this.district,
    required this.id,
  });
  late final String state;
  late final String district;
  late final String id;

  Address.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    district = json['district'];
    id = json['_id'];
  }
}

class Location {
  Location({
    required this.type,
    required this.coordinates,
    required this.id,
  });
  late final String type;
  late final List<double> coordinates;
  late final String id;

  Location.fromJson(Map<String, dynamic> json) {
    type = json['type'] ?? "";
    coordinates = List.castFrom<dynamic, double>(json['coordinates'] ?? [""]);
    id = json['_id'] ?? "";
  }
}

class Details {
  Details({
    required this.area,
    required this.floors,
    required this.roomsCount,
    required this.bedroomsCount,
    required this.bathroomCount,
    required this.deliveryTerm,
    required this.renterType,
    required this.rentFrequency,
  });
  late final int area;
  late final int floors;
  late final int roomsCount;
  late final int bedroomsCount;
  late final int bathroomCount;
  late final String deliveryTerm;
  late final String renterType;
  late final List rentFrequency;

  Details.fromJson(Map<String, dynamic> json) {
    area = json['area'];
    floors = json['floors'] ?? 0;
    roomsCount = json['roomsCount'] ?? 0;
    bedroomsCount = json['bedroomsCount'] ?? 0;
    bathroomCount = json['bathroomCount'] ?? 0;
    deliveryTerm = json['deliveryTerm'] ?? "";
    renterType = json['renterType'] ?? "";
    rentFrequency = json['rentFrequency'];
  }
}
