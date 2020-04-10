import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'issue.g.dart';

abstract class Issue implements Built<Issue, IssueBuilder> {
  static Serializer<Issue> get serializer => _$issueSerializer;

  String get expand;
  String get id;
  String get self;
  String get key;

  Issue._();
  factory Issue([void Function(IssueBuilder) updates]) = _$Issue;
}