import 'package:collection/collection.dart';

class Price {
  int? inUsd;
  int? inSp;
  dynamic meterInUsd;
  dynamic meterInSp;
  String? id;

  Price({this.inUsd, this.inSp, this.meterInUsd, this.meterInSp, this.id});

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        inUsd: json['inUSD'] as int?,
        inSp: json['inSP'] as int?,
        meterInUsd: json['meterInUSD'] as dynamic,
        meterInSp: json['meterInSP'] as dynamic,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'inUSD': inUsd,
        'inSP': inSp,
        'meterInUSD': meterInUsd,
        'meterInSP': meterInSp,
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
  int get hashCode =>
      inUsd.hashCode ^
      inSp.hashCode ^
      meterInUsd.hashCode ^
      meterInSp.hashCode ^
      id.hashCode;
}
