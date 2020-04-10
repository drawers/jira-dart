import 'package:flutter/material.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/presentation/issue_item.dart';
import 'package:jira/jira/presentation/keys.dart';

class IssueList extends StatelessWidget {

  final List<Issue> issues;

  IssueList(this.issues);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        key: Keys.issueList,
        itemCount: issues.length,
        itemBuilder: (BuildContext context, int index) {
          final issue = issues[index];

          return IssueItem(issue);
        },
      ),
    );
  }
}