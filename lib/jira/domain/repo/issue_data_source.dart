import 'package:jira/jira/data/issue_dto.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/rest_client.dart';

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

  Issue _fromDto(IssueDto issueDto) {
    var builder = IssueBuilder()
      ..id = issueDto.id
      ..key = issueDto.key
      ..expand = issueDto.expand
      ..self = issueDto.self;

    return builder.build();
  }
}
