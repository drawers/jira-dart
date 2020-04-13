import 'package:flutter/material.dart';
import 'package:jira/jira/common/theme.dart';
import 'package:shimmer/shimmer.dart';

class IssuePlaceholder extends StatelessWidget {
  final imageSize = 48.0;
  final Key key;

  IssuePlaceholder({this.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      leading: Shimmer.fromColors(
          baseColor: JiraTheme.darkerGrey,
          highlightColor: JiraTheme.lighterGrey,
          child: Container(
              width: imageSize,
              height: imageSize,
              color: JiraTheme.darkerGrey)),
      title: Shimmer.fromColors(
        baseColor: JiraTheme.darkerGrey,
        highlightColor: JiraTheme.lighterGrey,
        child: Text("This is a Jira ticket placeholder text",
            maxLines: 1,
            style: Theme.of(context).textTheme.headline6.apply(
                color: JiraTheme.darkerGrey,
                backgroundColor: JiraTheme.darkerGrey)),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: JiraTheme.darkerGrey,
        highlightColor: JiraTheme.lighterGrey,
        child: Text(
          "A shorter subtitle",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle1.apply(
              color: JiraTheme.darkerGrey,
              backgroundColor: JiraTheme.darkerGrey),
        ),
      ),
    );
  }
}
