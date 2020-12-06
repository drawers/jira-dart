import 'package:equatable/equatable.dart';

class Issue extends Equatable {
  final String id;
  final String self;
  final String key;
  final String summary;
  final String description;
  final String avatar;

  Issue(
      {this.id,
      this.self,
      this.key,
      this.summary,
      this.description,
      this.avatar});

  @override
  List<Object> get props => [id, self, key, summary, description, avatar];

  @override
  bool get stringify => true;
}
