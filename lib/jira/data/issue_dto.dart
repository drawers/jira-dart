import 'package:json_annotation/json_annotation.dart';

part 'issue_dto.g.dart';

@JsonSerializable()
class IssueDto {
  String expand;
  String id;
  String self;
  String key;

  IssueDto({this.expand, this.id, this.self, this.key});

  factory IssueDto.fromJson(Map<String, dynamic> json) => _$IssueDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IssueDtoToJson(this);

  @override
  String toString() {
    return 'Issue{expand: $expand, id: $id, self: $self, key: $key}';
  }
}
