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
    return searchResult.issues
        .map((issueDto) => DtoConversion.fromDto(issueDto))
        .toList();
  }

  @override
  Future<Issue> getById(String id) {
    if (error) {
      throw DioError();
    }

    return Future.value(Issue(
        id: "1234",
        self: "https://www.google.com",
        key: "ABD-3",
        description: "An issue that is very important",
        avatar: "https://www.google.com"));
  }
}