import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jira/jira/common/localization.dart';
import 'package:jira/jira/common/theme.dart';
import 'package:jira/jira/data/rest_client.dart';
import 'package:jira/jira/domain/repo/issue_repository.dart';
import 'package:jira/jira/domain/repo/remote_issue_data_source.dart';
import 'package:jira/jira/presentation/issue_detail_screen.dart';
import 'package:jira/jira/presentation/issue_list_screen.dart';
import 'package:jira/run_app.dart';
import 'package:logger/logger.dart';

var logger = Logger();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runBlocLibraryApp(IssueRepository(RemoteIssueDataSource(RestClient(Dio()))));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: JiraLocalizations().appTitle,
      localizationsDelegates: [JiraLocalizationsDelegate()],
      theme: JiraTheme.theme,
      initialRoute: '/',
      routes: {
        '/': (context) => IssueListScreen(),
        IssueDetailScreen.routeName: (context) => IssueDetailScreen()
      },
    );
  }
}
