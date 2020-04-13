import 'package:flutter/material.dart';
import 'package:jira/jira/presentation/Keys.dart';

class IssueItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String id;
  final String avatarUrl;
  final Key key;

  IssueItem({this.title, this.subtitle, this.id, this.avatarUrl, this.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      leading: Image.network(avatarUrl),
      title: Text(
        title,
        key: Keys.issueItemTitle(id),
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        subtitle,
        key: Keys.issueItemSubtitle(id),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
