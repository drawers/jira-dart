import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/bloc/issue_detail_event.dart';
import 'package:jira/jira/bloc/issue_detail_state.dart';
import 'package:jira/jira/domain/repo/issue_repository.dart';

class IssueDetailBloc extends Bloc<IssueDetailEvent, IssueDetailState> {
  final IssueRepository issueRepository;

  IssueDetailBloc({this.issueRepository});

  @override
  Stream<IssueDetailState> mapEventToState(IssueDetailEvent event) async* {
    if (event is Load) {
      yield Loading();
      yield* _stateFromLoad(event.id);
    } else {
      throw UnimplementedError();
    }
  }

  Stream<IssueDetailState> _stateFromLoad(String id) async* {
    try {
      final issue = await issueRepository.getById(id);
      yield Loaded(issue: issue);
    } catch (e) {
      yield Error();
    }
  }

  @override
  IssueDetailState get initialState {
    return Loading();
  }
}
