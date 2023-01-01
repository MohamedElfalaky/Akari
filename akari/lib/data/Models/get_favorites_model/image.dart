import 'package:collection/collection.dart';

class Image {
  String? id;
  String? normal;
  String? small;

  Image({this.id, this.normal, this.small});

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['_id'] as String?,
        normal: json['normal'] as String?,
        small: json['small'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'normal': normal,
        'small': small,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Image) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ normal.hashCode ^ small.hashCode;
}
