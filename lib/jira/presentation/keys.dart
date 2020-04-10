import 'package:flutter/material.dart';

class Keys {
  static const issueList = Key('__issueList__');
  static final issueItemCheckbox = (String id) => Key('IssueItem__${id}__Checkbox');
  static final issueItemTitle = (String id) => Key('IssueItem__${id}__Title');
  static final issueItemSubtitle = (String id) => Key('IssueItem__${id}__Title');
}
