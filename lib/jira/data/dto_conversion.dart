import 'package:jira/jira/data/creator_dto.dart';
import 'package:jira/jira/data/issue_dto.dart';
import 'package:jira/jira/domain/issue.dart';

class DtoConversion {
  static fromDto(IssueDto dto) {
    return Issue(
        dto.expand,
        dto.id,
        dto.self,
        dto.key,
        dto.fields["summary"] as String,
        dto.fields["description"] as String,
        Creator.map(dto.fields["creator"]).avatarUrls.s48x48);
  }
}
