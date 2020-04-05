import 'package:json_annotation/json_annotation.dart';

part 'issue.g.dart';

@JsonSerializable()
class Issue {
  String expand;
  String id;
  String self;
  String key;

  Issue({this.expand, this.id, this.self, this.key});

  factory Issue.fromJson(Map<String, dynamic> json) => _$IssueFromJson(json);

  Map<String, dynamic> toJson() => _$IssueToJson(this);

  @override
  String toString() {
    return 'Issue{expand: $expand, id: $id, self: $self, key: $key}';
  }
}
