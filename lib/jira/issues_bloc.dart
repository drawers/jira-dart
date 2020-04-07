import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/issue_repository.dart';

import 'issue_start.dart';
import 'issues_event.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final IssueRepository issueRepository;

  IssuesBloc({@required this.issueRepository});

  @override
  Stream<IssuesState> mapEventToState(IssuesEvent event) async* {
    yield* _mapDefaultState();
  }

  Stream<IssuesState> _mapDefaultState() async* {
    yield DefaultState();
  }

  @override
  IssuesState get initialState {
    return DefaultState();
  }
}