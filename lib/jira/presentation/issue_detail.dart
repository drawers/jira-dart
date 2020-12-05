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
        body: Center(child: Text(args.issueId)));
  }
}
