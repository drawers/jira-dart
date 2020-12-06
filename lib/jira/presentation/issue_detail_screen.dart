import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jira/jira/bloc/issue_detail_bloc.dart';
import 'package:jira/jira/bloc/issue_detail_state.dart';
import 'package:jira/jira/common/issue_detail_arguments.dart';
import 'package:jira/jira/common/localization.dart';
import 'package:jira/jira/common/theme.dart';
import 'package:jira/jira/presentation/keys.dart';
import 'package:shimmer/shimmer.dart';

class IssueDetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final IssueDetailArguments args = ModalRoute.of(context).settings.arguments;

    final issuesBloc = BlocProvider.of<IssueDetailBloc>(context);
    var issueDetailBloc = BlocBuilder<IssueDetailBloc, IssueDetailState>(
        builder: (context, state) {
      return Scaffold(
          appBar: AppBar(title: Text(JiraLocalizations.of(context).appTitle)),
          body: body(context, state));
    });
    issuesBloc.close();
    return issueDetailBloc;
  }

  Widget body(BuildContext context, IssueDetailState issueDetailState) {
    if (issueDetailState is Loading) {
      // return loading(context);
    } else if (issueDetailState is Loaded) {
      return loaded(context, issueDetailState);
    } else if (issueDetailState is Error) {
      throw Error();
    }
  }

  Widget loaded(BuildContext context, IssueDetailState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              key: Keys.issueDetailCard,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: loadingColumn(context),
              )),
        ),
      ],
    );
  }

  Column loadedColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Title", style: Theme.of(context).textTheme.headline4),
        Text("Summary", style: Theme.of(context).textTheme.headline6)
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
      ],
    );
  }
}
