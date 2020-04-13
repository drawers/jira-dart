// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';
import 'package:jira/jira/bloc/issues_bloc.dart';
import 'package:jira/jira/bloc/issues_event.dart';
import 'package:jira/jira/bloc/issues_state.dart';
import 'package:jira/jira/presentation/issue_item.dart';
import 'package:jira/jira/presentation/issue_list.dart';
import 'package:jira/jira/presentation/issue_placeholder.dart';
import 'package:jira/jira/presentation/keys.dart';
import 'package:jira/my_home_page.dart';
import 'package:mockito/mockito.dart';

import 'issue_list.dart';

class MockIssuesBloc extends MockBloc<IssuesEvent, IssuesState>
    implements IssuesBloc {}

void main() {
  group('For Issues it', () {
    IssuesBloc issuesBloc;

    setUp(() {
      issuesBloc = MockIssuesBloc();
    });

    testWidgets('should show placeholder when state is Loading',
        (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        when(issuesBloc.state).thenAnswer((_) => Loading());
        await tester.pumpWidget(BlocProvider<IssuesBloc>(
          create: (context) {
            return issuesBloc;
          },
          child: MaterialApp(
              home: Scaffold(body: MyHomePage(title: 'My Flutter app'))),
        ));
        expect(find.byKey(Keys.issueList), findsOneWidget);
        expect(
            find.byWidgetPredicate((w) => w.runtimeType == IssuePlaceholder,
                skipOffstage: false),
            findsNWidgets(IssueList.placeholderCount));
      });
    });

    testWidgets('should show real issues when state is Loaded',
        (WidgetTester tester) async {
      provideMockedNetworkImages(() async {
        when(issuesBloc.state).thenAnswer((_) => Loaded(FakeIssueData.issues));
        await tester.pumpWidget(BlocProvider<IssuesBloc>(
          create: (context) {
            return issuesBloc;
          },
          child: MaterialApp(
              home: Scaffold(body: MyHomePage(title: 'My Flutter app'))),
        ));
        expect(find.byKey(Keys.issueList), findsOneWidget);
        expect(
            find.byWidgetPredicate(
                (widget) => widget.runtimeType == IssuePlaceholder),
            findsNothing);
        expect(
            find.byWidgetPredicate((widget) => widget.runtimeType == IssueItem),
            findsNWidgets(2));
      });
    });
  });
}
