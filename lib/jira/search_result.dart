import 'package:json_annotation/json_annotation.dart';

import 'issue.dart';

part 'search_result.g.dart';

@JsonSerializable()
class SearchResult {
  String expand;
  int total;
  int startAt;
  int maxResults;
  List<Issue> issues;

  SearchResult({this.expand, this.total, this.startAt, this.maxResults});

  factory SearchResult.fromJson(Map<String, dynamic> json) =>
      _$SearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultToJson(this);

  @override
  String toString() {
    return 'SearchResult{expand: $expand, total: $total, startAt: $startAt, maxResults: $maxResults, issues: $issues}';
  }
}
