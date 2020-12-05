import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/bloc/issues_bloc.dart';
import 'package:jira/jira/bloc/issues_state.dart';
import 'package:jira/jira/common/localization.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/presentation/issue_placeholder.dart';
import 'package:jira/jira/presentation/keys.dart';

import 'issue_item.dart';

class IssueListScreen extends StatelessWidget {

  static final placeholderCount = 10;

  @override
  Widget build(BuildContext context) {
    final issuesBloc = BlocProvider.of<IssuesBloc>(context);
    var blocBuilder =
        BlocBuilder<IssuesBloc, IssuesState>(builder: (context, state) {
      return Scaffold(
          appBar: AppBar(title: Text(JiraLocalizations.of(context).appTitle)), body: body(context, state));
    });
    issuesBloc.close();
    return blocBuilder;
  }

  Widget body(BuildContext context, IssuesState issuesState) {
    if (issuesState is Loading) {
      return loading(context);
    } else if (issuesState is Loaded) {
      return loaded(context, issuesState);
    } else if (issuesState is Error) {}
  }

  Widget loading(BuildContext context) {
    return ListView.builder(
        key: Keys.issueList,
        itemCount: placeholderCount,
        itemBuilder: (BuildContext context, int index) {
          return IssuePlaceholder(key: Keys.issuePlaceholder(index.toString()));
        });
  }

  Widget loaded(BuildContext context, Loaded state) {
    return ListView.builder(
        key: Keys.issueList,
        itemCount: state.issues.length,
        itemBuilder: (BuildContext context, int index) {
          final Issue issue = state.issues[index];
          return IssueItem(
              key: Keys.issueItem(index.toString()),
              title: issue.key,
              subtitle: issue.summary,
              id: issue.key,
              avatarUrl: issue.avatar);
        });
  }
}
