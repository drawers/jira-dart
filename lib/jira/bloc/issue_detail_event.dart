import 'package:equatable/equatable.dart';

abstract class IssueDetailEvent extends Equatable {
  const IssueDetailEvent();

  @override
  List<Object> get props => [];
}

class Load extends IssueDetailEvent {}