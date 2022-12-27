import 'package:collection/collection.dart';

import 'participant.dart';

class Datum {
  String? id;
  Participant? participant;
  String? lastMessage;
  DateTime? createdAt;

  Datum({this.id, this.participant, this.lastMessage, this.createdAt});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['_id'] as String?,
        participant: json['participant'] == null
            ? null
            : Participant.fromJson(json['participant'] as Map<String, dynamic>),
        lastMessage: json['lastMessage'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'participant': participant?.toJson(),
        'lastMessage': lastMessage,
        'createdAt': createdAt?.toIso8601String(),
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
      participant.hashCode ^
      lastMessage.hashCode ^
      createdAt.hashCode;
}
