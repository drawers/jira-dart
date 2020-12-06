import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/bloc/issue_detail_bloc.dart';
import 'package:jira/jira/bloc/issue_detail_event.dart';
import 'package:jira/jira/bloc/issue_detail_state.dart';
import 'package:jira/jira/common/issue_detail_arguments.dart';
import 'package:jira/jira/common/theme.dart';
import 'package:jira/jira/domain/issue.dart';
import 'package:jira/jira/presentation/keys.dart';
import 'package:shimmer/shimmer.dart';

class IssueDetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final IssueDetailArguments args = ModalRoute.of(context).settings.arguments;

    final blocBuilder = BlocBuilder<IssueDetailBloc, IssueDetailState>(
        builder: (context, state) {
      return Scaffold(
          key: Keys.issueDetailScreen(args.issueId),
          appBar: AppBar(title: Text(args.issueId)),
          body: body(context, state));
    });
    return blocBuilder;
  }

  Widget body(BuildContext context, IssueDetailState issueDetailState) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: mapStateToColumn(issueDetailState, context),
                )),
          ),
        ],
      ),
    );
  }

  mapStateToColumn(IssueDetailState issueDetailState, BuildContext context) {
    var column;
    if (issueDetailState is Loading) {
      column = loadingColumn(context);
    } else if (issueDetailState is Loaded) {
      column = loadedColumn(context, issueDetailState.issue);
    } else {
      throw StateError("Unknown state");
    }
    return column;
  }

  Widget loadedColumn(BuildContext context, Issue issue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(issue.summary, style: Theme
            .of(context)
            .textTheme
            .headline6),
        Container(margin: EdgeInsets.only(top: 20.0),
          child: Text(issue.description, style: Theme
              .of(context)
              .textTheme
              .bodyText2),
        )
      ],
    );
  }

  Column loadingColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Shimmer.fromColors(
          baseColor: JiraTheme.darkerGrey,
          highlightColor: JiraTheme.lighterGrey,
          child: Text("A long title",
              style: Theme.of(context).textTheme.headline4.apply(
                  color: JiraTheme.darkerGrey,
                  backgroundColor: JiraTheme.darkerGrey)),
        ),
        Shimmer.fromColors(
          baseColor: JiraTheme.darkerGrey,
          highlightColor: JiraTheme.lighterGrey,
          child: Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Text(
              """
A long description that goes across multiple lines. 
The quick brown fox jumps 
over the lazy dog and then goes on to do something else.
""",
              style: Theme.of(context).textTheme.bodyText2.apply(
                  color: JiraTheme.darkerGrey,
                  backgroundColor: JiraTheme.darkerGrey),
            ),
          ),
        )
      ],
    );
  }
}
