// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Suggestion {
  Suggestion(this.activity, this.type);
  final String activity;
  final String type;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'activity': activity,
      'type': type,
    };
  }

  factory Suggestion.fromMap(Map<String, dynamic> map) {
    return Suggestion(
      map['activity'] as String,
      map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Suggestion.fromJson(String source) =>
      Suggestion.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Suggestion other) {
    if (identical(this, other)) return true;

    return other.activity == activity && other.type == type;
  }

  @override
  int get hashCode => activity.hashCode ^ type.hashCode;
}
