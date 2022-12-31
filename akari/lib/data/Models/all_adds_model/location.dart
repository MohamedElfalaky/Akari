import 'package:collection/collection.dart';

class Location {
  String? type;
  List<double>? coordinates;
  String? id;

  Location({this.type, this.coordinates, this.id});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json['type'] as String?,
        coordinates: json['coordinates'] as List<double>?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'coordinates': coordinates,
        '_id': id,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Location) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => type.hashCode ^ coordinates.hashCode ^ id.hashCode;
}
