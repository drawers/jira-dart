import 'package:equatable/equatable.dart';
import 'package:jira/jira/data/creator_dto.dart';
import 'package:jira/jira/data/issue_dto.dart';

class Issue extends Equatable {
  final String expand;
  final String id;
  final String self;
  final String key;
  final String summary;
  final String description;
  final String avatar;

  Issue(this.expand, this.id, this.self, this.key, this.summary,
      this.description, this.avatar);

  @override
  List<Object> get props =>
      [expand, id, self, key, summary, description, avatar];

  @override
  bool get stringify => true;
}
