import 'package:equatable/equatable.dart';
import 'package:jira/jira/domain/issue.dart';

abstract class IssueDetailState extends Equatable {
  const IssueDetailState();

  @override
  List<Object> get props => [];
}

class Loading extends IssueDetailState {}

class Loaded extends IssueDetailState {
  final Issue issue;

  Loaded({this.issue});

  @override
  List<Object> get props => [issue];

  @override
  String toString() => 'Loaded { issue: $issue }';
}

class Error extends IssueDetailState {}
