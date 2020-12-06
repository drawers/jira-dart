import 'package:json_annotation/json_annotation.dart';

part 'issue_dto.g.dart';

@JsonSerializable()
class IssueDto {
  String expand;
  String id;
  String self;
  String key;
  Map<String, dynamic> fields;

  IssueDto({this.expand, this.id, this.self, this.key, this.fields});

  factory IssueDto.fromJson(Map<String, dynamic> json) =>
      _$IssueDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IssueDtoToJson(this);

  @override
  String toString() {
    return 'IssueDto{expand: $expand, id: $id, self: $self, key: $key, fields: $fields}';
  }
}