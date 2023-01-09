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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['message'] = message;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
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
    required this.onlyAcceptUSD,
    required this.isNegotiable,
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
    required this.views,
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
  late final int downPaymentPercentage;
  late final bool onlyAcceptUSD;
  late final bool isNegotiable;
  late final Rating rating;
  late final bool isActive;
  late final bool isSettled;
  late final Address address;
  late final Location location;
  late final Details details;
  late final List<String> amenities;
  late final String advertiser;
  late final String name;
  late final String mobileNumber;
  late final String capacity;
  late final String contactMethod;
  late final int views;
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
    downPaymentPercentage = json['downPaymentPercentage'] ?? 0;
    onlyAcceptUSD = json['onlyAcceptUSD'];
    isNegotiable = json['isNegotiable'];
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
    views = json['views'];
    termsAccepted = json['termsAccepted'];
    V = json['__v'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['title'] = title;
    _data['images'] = images.map((e) => e.toJson()).toList();
    _data['description'] = description;
    _data['contractType'] = contractType;
    _data['buildingType'] = buildingType;
    _data['price'] = price.toJson();
    _data['paymentOption'] = paymentOption;
    _data['downPaymentPercentage'] = downPaymentPercentage;
    _data['onlyAcceptUSD'] = onlyAcceptUSD;
    _data['isNegotiable'] = isNegotiable;
    _data['rating'] = rating.toJson();
    _data['isActive'] = isActive;
    _data['isSettled'] = isSettled;
    _data['address'] = address.toJson();
    _data['location'] = location.toJson();
    _data['details'] = details.toJson();
    _data['amenities'] = amenities;
    _data['advertiser'] = advertiser;
    _data['name'] = name;
    _data['mobileNumber'] = mobileNumber;
    _data['capacity'] = capacity;
    _data['contactMethod'] = contactMethod;
    _data['views'] = views;
    _data['termsAccepted'] = termsAccepted;
    _data['__v'] = V;
    _data['createdAt'] = createdAt;
    return _data;
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['normal'] = normal;
    _data['small'] = small;
    return _data;
  }
}

class Price {
  Price({
    required this.inUSD,
    required this.inSP,
    required this.meterInUSD,
    required this.meterInSP,
    required this.id,
  });
  late final int inUSD;
  late final int inSP;
  late final int meterInUSD;
  late final int meterInSP;
  late final String id;

  Price.fromJson(Map<String, dynamic> json) {
    inUSD = json['inUSD'];
    inSP = json['inSP'];
    meterInUSD = json['meterInUSD'] ?? 0;
    meterInSP = json['meterInSP'] ?? 0;
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['inUSD'] = inUSD;
    _data['inSP'] = inSP;
    _data['meterInUSD'] = meterInUSD;
    _data['meterInSP'] = meterInSP;
    _data['_id'] = id;
    return _data;
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

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['result'] = result;
    _data['count'] = count;
    _data['all'] = all;
    return _data;
  }
}

class Address {
  Address({
    required this.state,
    required this.district,
    required this.detailedAddress,
    required this.POBox,
    required this.id,
  });
  late final String state;
  late final String district;
  late final String detailedAddress;
  late final String POBox;
  late final String id;

  Address.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    district = json['district'];
    detailedAddress = json['detailedAddress'];
    POBox = json['POBox'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['state'] = state;
    _data['district'] = district;
    _data['detailedAddress'] = detailedAddress;
    _data['POBox'] = POBox;
    _data['_id'] = id;
    return _data;
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
    coordinates = List.castFrom<dynamic, double>(json['coordinates'] ?? []);
    id = json['_id'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['coordinates'] = coordinates;
    _data['_id'] = id;
    return _data;
  }
}

class Details {
  Details({
    required this.subType,
    required this.area,
    required this.floors,
    required this.roomsCount,
    required this.bedroomsCount,
    required this.bathroomCount,
    required this.deliveryTerm,
    required this.renterType,
    required this.rentFrequency,
  });
  late final String subType;
  late final int area;
  late final int floors;
  late final int roomsCount;
  late final int bedroomsCount;
  late final int bathroomCount;
  late final String deliveryTerm;
  late final String renterType;
  late final List<String> rentFrequency;

  Details.fromJson(Map<String, dynamic> json) {
    subType = json['subType'];
    area = json['area'];
    floors = json['floor'] ?? 1;
    roomsCount = json['roomsCount'] ?? 1;
    bedroomsCount = json['bedroomsCount'] ?? 1;
    bathroomCount = json['bathroomCount'] ?? 1;
    deliveryTerm = json['deliveryTerm'];
    renterType = json['renterType'];
    rentFrequency = List.castFrom<dynamic, String>(json['rentFrequency']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['subType'] = subType;
    _data['area'] = area;
    _data['floor'] = floors;
    _data['roomsCount'] = roomsCount;
    _data['bedroomsCount'] = bedroomsCount;
    _data['bathroomCount'] = bathroomCount;
    _data['deliveryTerm'] = deliveryTerm;
    _data['renterType'] = renterType;
    _data['rentFrequency'] = rentFrequency;
    return _data;
  }
}
