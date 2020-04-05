// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Issue _$IssueFromJson(Map<String, dynamic> json) {
  return Issue(
    expand: json['expand'] as String,
    id: json['id'] as String,
    self: json['self'] as String,
    key: json['key'] as String,
  );
}

Map<String, dynamic> _$IssueToJson(Issue instance) => <String, dynamic>{
      'expand': instance.expand,
      'id': instance.id,
      'self': instance.self,
      'key': instance.key,
    };
