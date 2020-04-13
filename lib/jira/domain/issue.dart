import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class Issue extends Equatable {
  final String id;
  final String self;
  final String key;
  final String summary;
  final String avatar;

  Issue(
      {@required this.id,
      @required this.self,
      @required this.key,
      @required this.summary,
      @required this.avatar});

  @override
  List<Object> get props => [id, self, key, summary, avatar];

  @override
  bool get stringify => true;
}
