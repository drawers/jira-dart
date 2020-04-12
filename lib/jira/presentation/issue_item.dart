import 'package:flutter/material.dart';
import 'package:jira/jira/presentation/Keys.dart';

class IssueItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String id;
  final String avatarUrl;

  IssueItem({this.title, this.subtitle, this.id, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      leading: Image.network(avatarUrl),
      title: Text(
        title,
        key: Keys.issueItemTitle(title),
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        subtitle,
        key: Keys.issueItemSubtitle(subtitle),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
