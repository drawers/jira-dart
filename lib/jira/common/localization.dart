import 'package:flutter/material.dart';

class JiraLocalizations {
  static JiraLocalizations of(BuildContext buildContext) {
    return Localizations.of<JiraLocalizations>(buildContext, JiraLocalizations);
  }

  String get appTitle => "Jira API toy";
}

class JiraLocalizationsDelegate
    extends LocalizationsDelegate<JiraLocalizations> {
  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");

  @override
  Future<JiraLocalizations> load(Locale locale) =>
      Future(() => JiraLocalizations());

  @override
  bool shouldReload(LocalizationsDelegate<JiraLocalizations> old) => false;
}
