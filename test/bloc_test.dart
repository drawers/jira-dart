import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira/jira/bloc/issues_bloc.dart';
import 'package:jira/jira/bloc/issues_event.dart';
import 'package:jira/jira/bloc/issues_state.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/domain/repo/issue_repository.dart';

import 'fake_issues_data_source.dart';

class MockIssuesBlock extends MockBloc<IssuesEvent, IssuesState>
    implements IssuesBloc {}

void main() {
  group('load behavior', () {
    blocTest<IssuesBloc, IssuesEvent, IssuesState>('emit loading then loaded',
        build: () {
          final issuesBloc = IssuesBloc(
              issueRepository: IssueRepository(FakeIssuesDataSource()));
          return issuesBloc;
        },
        act: (IssuesBloc bloc) async => bloc.add(Load()),
        expect: [
          Loading(),
          Loaded([
            Issue(
                id: "1517938",
                self:
                    "https://jira.atlassian.com/rest/api/latest/issue/1517938",
                key: "SRCTREEWIN-13058",
                summary:
                    "Sourcetree crashes when checking out branch in browser.",
                avatar:
                    "https://jira.atlassian.com/secure/useravatar?ownerId=JIRAUSER4715861&avatarId=2413314"),
            Issue(
                id: "1515643",
                self:
                    "https://jira.atlassian.com/rest/api/latest/issue/1515643",
                key: "SRCTREEWIN-13057",
                summary: "SourceTree does not appear in Win10 Start Menu",
                avatar:
                    "https://jira.atlassian.com/secure/useravatar?ownerId=ccbates&avatarId=2328220")
          ])
        ]);

    blocTest<IssuesBloc, IssuesEvent, IssuesState>('emit loading then error',
        build: () {
          final issuesBloc = IssuesBloc(
              issueRepository:
                  IssueRepository(FakeIssuesDataSource()..error = true));
          return issuesBloc;
        },
        act: (IssuesBloc bloc) async => bloc.add(Load()),
        expect: [Loading(), Error()]);
  });
}
