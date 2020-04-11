import 'package:equatable/equatable.dart';

class Issue extends Equatable {
  final String expand;
  final String id;
  final String self;
  final String key;

  Issue(this.expand, this.id, this.self, this.key);

  @override
  List<Object> get props => [expand, id, self, key];

  @override
  bool get stringify => true;
}
