import 'package:jira/jira/data/issue_dto.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/data/rest_client.dart';

class IssueDataSource {
  final RestClient restClient;

  IssueDataSource(this.restClient);

  Future<List<Issue>> issues() {
    return restClient
        .getResults("", 0, 5)
        .asStream()
        .map((searchResult) => searchResult.issues)
        .expand((dto) => dto)
        .map((dto) => _fromDto(dto))
        .toList();
  }

  Issue _fromDto(IssueDto dto) {
    return Issue(dto.expand, dto.id, dto.self, dto.key);
  }
}
