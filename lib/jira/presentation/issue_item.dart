import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/bloc/issue_detail_bloc.dart';
import 'package:jira/jira/bloc/issue_detail_event.dart';
import 'package:jira/jira/common/issue_detail_arguments.dart';
import 'package:jira/jira/presentation/Keys.dart';
import 'package:jira/jira/presentation/issue_detail_screen.dart';

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
      onTap: () => navigateToDetail(context),
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

  Future<Object> navigateToDetail(BuildContext context) {
    BlocProvider.of<IssueDetailBloc>(context).add(Load(id));
    return Navigator.pushNamed(context, IssueDetailScreen.routeName,
        arguments: IssueDetailArguments(id));
  }
}
