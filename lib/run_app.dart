import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/bloc/issues_bloc.dart';
import 'package:jira/jira/domain/repo/issue_repository.dart';
import 'package:jira/jira/common/logging_bloc_delegate.dart';
import 'package:jira/main.dart';

import 'jira/bloc/issues_event.dart';

void runBlocLibraryApp(IssueRepository issueRepository) {
  BlocSupervisor.delegate = LoggingBlocDelegate(logger);
  runApp(
    BlocProvider<IssuesBloc>(
      create: (context) {
        return IssuesBloc(issueRepository: issueRepository)..add(Load());
      },
      child: MyApp(),
    ),
  );
}
