import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IssuePlaceholder extends StatelessWidget {
  final darkerGrey = Colors.grey[300];
  final lighterGrey = Colors.grey[100];

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      leading: Shimmer.fromColors(
          baseColor: darkerGrey,
          highlightColor: lighterGrey,
          child: Checkbox(
            value: true,
            onChanged: null,
          )),
      title: Shimmer.fromColors(
        baseColor: darkerGrey,
        highlightColor: lighterGrey,
        child: Text("This is a Jira ticket placeholder text",
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline6
                .apply(color: darkerGrey, backgroundColor: darkerGrey)),
      ),
      subtitle: Shimmer.fromColors(
        baseColor: darkerGrey,
        highlightColor: lighterGrey,
        child: Text(
          "A shorter subtitle",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .apply(color: darkerGrey, backgroundColor: darkerGrey),
        ),
      ),
    );
  }
}