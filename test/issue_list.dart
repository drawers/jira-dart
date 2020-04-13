import 'package:jira/jira/domain/issue.dart';

class FakeIssueData {
  static final issues = [
    Issue(
        id: "1517938",
        self: "https://jira.atlassian.com/rest/api/latest/issue/1517938",
        key: "SRCTREEWIN-13058",
        summary: "Sourcetree crashes when checking out branch in browser.",
        avatar:
            "https://jira.atlassian.com/secure/useravatar?ownerId=JIRAUSER4715861&avatarId=2413314"),
    Issue(
        id: "1515643",
        self: "https://jira.atlassian.com/rest/api/latest/issue/1515643",
        key: "SRCTREEWIN-13057",
        summary: "SourceTree does not appear in Win10 Start Menu",
        avatar:
            "https://jira.atlassian.com/secure/useravatar?ownerId=ccbates&avatarId=2328220")
  ];
}
