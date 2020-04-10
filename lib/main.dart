import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jira/jira/domain/repo/issue_data_source.dart';
import 'package:jira/jira/domain/repo/issue_repository.dart';
import 'package:jira/jira/rest_client.dart';
import 'package:jira/run_app.dart';
import 'package:logger/logger.dart';

import 'my_home_page.dart';

var logger = Logger();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runBlocLibraryApp(IssueRepository(IssueDataSource(RestClient(Dio()))));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
