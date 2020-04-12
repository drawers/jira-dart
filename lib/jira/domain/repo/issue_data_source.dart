import 'package:jira/jira/data/creator_dto.dart';
import 'package:jira/jira/data/issue_dto.dart';
import 'package:jira/jira/data/rest_client.dart';
import 'package:jira/jira/domain/issue.dart';

class IssueDataSource {
  final startAt = 0;
  final maxResults = 5;

  final RestClient restClient;

  IssueDataSource(this.restClient);

  Future<List<Issue>> issues() {
    return restClient
        .getResults("", startAt, maxResults)
        .asStream()
        .map((searchResult) => searchResult.issues)
        .expand((dto) => dto)
        .map((dto) => _fromDto(dto))
        .toList();
  }

  Issue _fromDto(IssueDto dto) {
    return Issue(
        dto.expand,
        dto.id,
        dto.self,
        dto.key,
        dto.fields["summary"] as String,
        dto.fields["description"] as String,
        Creator.map(dto.fields["creator"]).avatarUrls.s48x48);
  }
}
