import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/domain/repo/issue_data_source.dart';

class IssueRepository {
  final IssueDataSource issueDataSource;

  IssueRepository(this.issueDataSource);

  Future<List<Issue>> issues() {
    return Future.delayed(
        Duration(milliseconds: 1200), () => issueDataSource.issues());
  }
}
