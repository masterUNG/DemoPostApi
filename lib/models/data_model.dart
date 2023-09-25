// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DataModel {
  final String location;
  final String event_name;
  final String topic_name_event;
  DataModel({
    required this.location,
    required this.event_name,
    required this.topic_name_event,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'location': location,
      'event_name': event_name,
      'topic_name_event': topic_name_event,
    };
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      location: (map['location'] ?? '') as String,
      event_name: (map['event_name'] ?? '') as String,
      topic_name_event: (map['topic_name_event'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) => DataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
