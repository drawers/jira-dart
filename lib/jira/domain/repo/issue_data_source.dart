import 'package:jira/jira/domain/issue.dart';

abstract class IssueDataSource {
  Future<List<Issue>> issues();
}
