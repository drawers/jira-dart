import 'package:equatable/equatable.dart';
import 'package:jira/jira/domain/issue.dart';

abstract class IssuesState extends Equatable {
  const IssuesState();

  @override
  List<Object> get props => [];
}

class Loading extends IssuesState {}

class Loaded extends IssuesState {
  final List<Issue> issues;

  const Loaded([this.issues = const []]);

  @override
  List<Object> get props => [issues];

  @override
  String toString() => 'Loaded { issues: $issues }';
}

class Error extends IssuesState {}
