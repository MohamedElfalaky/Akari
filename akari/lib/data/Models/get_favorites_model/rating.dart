import 'package:collection/collection.dart';

class Rating {
  dynamic result;
  int? count;
  List<dynamic>? all;

  Rating({this.result, this.count, this.all});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        result: json['result'] as dynamic,
        count: json['count'] as int?,
        all: json['all'] as List<dynamic>?,
      );

  Map<String, dynamic> toJson() => {
        'result': result,
        'count': count,
        'all': all,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Rating) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => result.hashCode ^ count.hashCode ^ all.hashCode;
}
