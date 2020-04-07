import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/bloc/issues_bloc.dart';
import 'package:jira/jira/issue_repository.dart';
import 'package:jira/logging_bloc_delegate.dart';
import 'package:jira/main.dart';

import 'jira/bloc/issues_event.dart';

void runBlocLibraryApp(IssueRepository issueRepository) {
  // BlocSupervisor oversees Blocs and delegates to BlocDelegate.
  // We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
  // This will allow us to handle all transitions and errors in SimpleBlocDelegate.
  BlocSupervisor.delegate = LoggingBlocDelegate(logger);
  runApp(
    BlocProvider<IssuesBloc>(
      create: (context) {
        return IssuesBloc(issueRepository: issueRepository)..add(LoadEvent());
      },
      child: MyApp(),
    ),
  );
}
