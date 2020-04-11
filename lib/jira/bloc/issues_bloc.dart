import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/domain/repo/issue_repository.dart';

import 'issues_event.dart';
import 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final IssueRepository issueRepository;

  IssuesBloc({@required this.issueRepository});

  @override
  Stream<IssuesState> mapEventToState(IssuesEvent event) async* {
    if (event is Load) {
      yield* _stateFromLoad();
    } else {
      debugPrint(event.toString());
    }
  }

  Stream<IssuesState> _stateFromError() async* {
    yield Error();
  }

  Stream<IssuesState> _stateFromLoad() async* {
    try {
      final issues = await issueRepository.issues();
      yield Loaded(issues);
    } catch (_) {
      yield Error();
    }
  }

  @override
  IssuesState get initialState {
    return Loading();
  }
}
