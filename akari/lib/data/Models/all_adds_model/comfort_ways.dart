import 'package:collection/collection.dart';

class ComfortWays {
  bool? hasElevator;
  bool? hasWifi;
  bool? hasKitchen;

  ComfortWays({this.hasElevator, this.hasWifi, this.hasKitchen});

  factory ComfortWays.fromJson(Map<String, dynamic> json) => ComfortWays(
        hasElevator: json['hasElevator'] as bool?,
        hasWifi: json['hasWifi'] as bool?,
        hasKitchen: json['hasKitchen'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'hasElevator': hasElevator,
        'hasWifi': hasWifi,
        'hasKitchen': hasKitchen,
      };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ComfortWays) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode =>
      hasElevator.hashCode ^ hasWifi.hashCode ^ hasKitchen.hashCode;
}
