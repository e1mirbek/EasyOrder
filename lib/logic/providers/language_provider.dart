import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale _appLocale = const Locale('en');

  Locale get appLocale => _appLocale;

  void setLanguage(Locale locale) {
    _appLocale = locale;
    notifyListeners();
  }
}
