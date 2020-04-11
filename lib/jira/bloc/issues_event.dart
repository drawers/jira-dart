import 'package:equatable/equatable.dart';

abstract class IssuesEvent extends Equatable {
  const IssuesEvent();

  @override
  List<Object> get props => [];
}

class Load extends IssuesEvent {}