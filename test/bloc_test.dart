import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jira/jira/bloc/issues_bloc.dart';
import 'package:jira/jira/bloc/issues_event.dart';
import 'package:jira/jira/bloc/issues_state.dart';
import 'package:jira/jira/domain/repo/issue_repository.dart';

import 'fake_issues_repository.dart';

class MockIssuesBlock extends MockBloc<IssuesEvent, IssuesState>
    implements IssuesBloc {}

void main() {
  group('loading', () {
    blocTest<IssuesBloc, IssuesEvent, IssuesState>('emit loading then loaded',
        build: () {
          final issuesBloc = IssuesBloc(
              issueRepository: IssueRepository(FakeIssuesDataSource()));
          return issuesBloc;
        },
        act: (IssuesBloc bloc) async => bloc.add(Load()),
        expect: [Loading(), Loaded([])]);
  });
}
