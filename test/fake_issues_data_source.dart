import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jira/jira/data/dto_conversion.dart';
import 'package:jira/jira/data/search_result_dto.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/domain/repo/issue_data_source.dart';

class FakeIssuesDataSource implements IssueDataSource {

  bool error = false;

  @override
  Future<List<Issue>> issues() async {
    if (error) {
      throw DioError();
    }

    final file = File('test/search_result.json');
    final body = await file.readAsString();
    final jsonBody = json.decode(body);
    final SearchResultDto searchResult = SearchResultDto.fromJson(jsonBody);
    return searchResult.issues.map((issueDto) => DtoConversion.fromDto(issueDto)).toList();
  }
}