import 'package:collection/collection.dart';

class Price {
  int? inUsd;
  int? inSp;
  String? id;

  Price({this.inUsd, this.inSp, this.id});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        inUsd: json['inUSD'] as int?,
        inSp: json['inSP'] as int?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'inUSD': inUsd,
        'inSP': inSp,
        '_id': id,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Price) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => inUsd.hashCode ^ inSp.hashCode ^ id.hashCode;
}
