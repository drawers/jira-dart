import 'package:equatable/equatable.dart';
import 'package:jira/jira/domain/issue.dart';

abstract class IssueDetailState extends Equatable {
  const IssueDetailState();

  @override
  List<Object> get props => [];
}

class Loading extends IssueDetailState {}

class Loaded extends IssueDetailState {
  final List<Issue> issues;

  const Loaded([this.issues = const []]);

  @override
  List<Object> get props => [issues];

  @override
  String toString() => 'Loaded { issues: $issues }';
}

class Error extends IssueDetailState {}
