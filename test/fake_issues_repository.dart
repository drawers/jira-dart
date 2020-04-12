import 'dart:convert';
import 'dart:io';

import 'package:jira/jira/data/dto_conversion.dart';
import 'package:jira/jira/data/search_result_dto.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/domain/repo/issue_data_source.dart';

class FakeIssuesDataSource implements IssueDataSource {
  @override
  Future<List<Issue>> issues() async {
    final file = File('search_result.json');
    final body = await file.readAsString();
    final jsonBody = json.decode(body);
    final searchResult = SearchResultDto.fromJson(jsonBody);
    return searchResult.issues.map((issueDto) => DtoConversion.fromDto(issueDto));
  }
}