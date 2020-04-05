// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResult _$SearchResultFromJson(Map<String, dynamic> json) {
  return SearchResult(
    expand: json['expand'] as String,
    total: json['total'] as int,
    startAt: json['startAt'] as int,
    maxResults: json['maxResults'] as int,
  )..issues = (json['issues'] as List)
      ?.map((e) => e == null ? null : Issue.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$SearchResultToJson(SearchResult instance) =>
    <String, dynamic>{
      'expand': instance.expand,
      'total': instance.total,
      'startAt': instance.startAt,
      'maxResults': instance.maxResults,
      'issues': instance.issues,
    };
