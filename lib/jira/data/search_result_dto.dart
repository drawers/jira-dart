import 'package:json_annotation/json_annotation.dart';

import 'issue_dto.dart';

part 'search_result_dto.g.dart';

@JsonSerializable()
class SearchResultDto {
  String expand;
  int total;
  int startAt;
  int maxResults;
  List<IssueDto> issues;

  SearchResultDto({this.expand, this.total, this.startAt, this.maxResults});

  factory SearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SearchResultDtoToJson(this);

  @override
  String toString() {
    return 'SearchResult{expand: $expand, total: $total, startAt: $startAt, maxResults: $maxResults, issues: $issues}';
  }
}
