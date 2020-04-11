import 'package:flutter/material.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/presentation/Keys.dart';
import 'package:shimmer/shimmer.dart';

class IssueItem extends StatelessWidget {
  final Issue issue;

  IssueItem(this.issue);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      leading: Checkbox(
        key: Keys.issueItemCheckbox(issue.id),
        value: true,
        onChanged: null,
      ),
      title: Text(
        issue.self,
        key: Keys.issueItemTitle(issue.id),
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        "subtitle",
        key: Keys.issueItemSubtitle(issue.id),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}