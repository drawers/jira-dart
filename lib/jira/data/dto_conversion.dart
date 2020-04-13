import 'package:jira/jira/data/creator_dto.dart';
import 'package:jira/jira/data/issue_dto.dart';
import 'package:jira/jira/domain/issue.dart';

class DtoConversion {
  static Issue fromDto(IssueDto dto) {
    return Issue(
        id: dto.id,
        self: dto.self,
        key: dto.key,
        summary: dto.fields["summary"] as String,
        avatar: Creator.map(dto.fields["creator"]).avatarUrls.s48x48);
  }
}
