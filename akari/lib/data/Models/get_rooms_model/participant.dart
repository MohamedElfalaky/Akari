import 'package:collection/collection.dart';

class Participant {
  String? id;
  String? name;
  dynamic image;

  Participant({this.id, this.name, this.image});

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        image: json['image'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'image': image,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Participant) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
