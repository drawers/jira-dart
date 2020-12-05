import 'package:flutter/material.dart';
import 'package:jira/jira/common/issue_detail_arguments.dart';

class IssueDetailPage extends StatelessWidget {
  static const routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final IssueDetailArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: AppBar(
          title: Text(args.issueId),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: Text("Title",
                          style: Theme.of(context).textTheme.headline4)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Row(children: [
                Text("Summary", style: Theme.of(context).textTheme.headline6)
              ]),
            )
          ],
        ));
  }
}
