import 'package:flutter/material.dart';
import 'package:jira/jira/common/issue_detail_arguments.dart';
import 'package:jira/jira/presentation/keys.dart';

class IssueDetailScreen extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final IssueDetailArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.issueId),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  key: Keys.issueDetailCard,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Title",
                            style: Theme.of(context).textTheme.headline4),
                        Container(
                          margin: EdgeInsets.only(top: 24.0),
                          child: Text("Summary",
                              style: Theme.of(context).textTheme.headline6),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ));
  }
}
