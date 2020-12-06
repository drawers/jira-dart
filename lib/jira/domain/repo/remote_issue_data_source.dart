import 'package:jira/jira/data/dto_conversion.dart';
import 'package:jira/jira/data/rest_client.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/domain/repo/issue_data_source.dart';

class RemoteIssueDataSource implements IssueDataSource {
  final startAt = 0;
  final maxResults = 20;

  final RestClient restClient;

  RemoteIssueDataSource(this.restClient);

  @override
  Future<List<Issue>> issues() {
    return restClient
        .getResults("", startAt, maxResults)
        .asStream()
        .map((searchResult) => searchResult.issues)
        .expand((dto) => dto)
        .map((dto) => DtoConversion.fromDto(dto))
        .toList();
  }

  @override
  Future<Issue> getById(String id) {
    throw restClient
        .getById(id)
        .asStream()
        .map((dto) => DtoConversion.fromDto(dto))
        .first;
  }
}
