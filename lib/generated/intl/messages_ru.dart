// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Уже есть аккаунт?",
    ),
    "emailHint": MessageLookupByLibrary.simpleMessage("Введите вашу почту"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Введите корректный email",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Электронная почта"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Введите вашу почту"),
    "fullNameHint": MessageLookupByLibrary.simpleMessage(
      "Введите ваше полное имя",
    ),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("Полное имя"),
    "fullNameRequired": MessageLookupByLibrary.simpleMessage(
      "Введите полное имя",
    ),
    "fullNameTooShort": MessageLookupByLibrary.simpleMessage(
      "Имя должно содержать минимум 2 символа",
    ),
    "languageName": MessageLookupByLibrary.simpleMessage("Русский"),
    "loginSubtitle": MessageLookupByLibrary.simpleMessage(
      "Откройте для себя эксклюзивные мировые предложения.",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage(
      "Войдите в свой аккаунт",
    ),
    "onlyLettersName": MessageLookupByLibrary.simpleMessage("Только буквы"),
    "passwordHint": MessageLookupByLibrary.simpleMessage("Введите пароль"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Пароль"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage("Введите пароль"),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Пароль должен содержать минимум 6 символов",
    ),
    "registerSubTitle": MessageLookupByLibrary.simpleMessage(
      "Присоединяйтесь и начните пользоваться приложением",
    ),
    "registerTitle": MessageLookupByLibrary.simpleMessage("Создайте аккаунт"),
    "signIn": MessageLookupByLibrary.simpleMessage("Войти"),
    "signUp": MessageLookupByLibrary.simpleMessage("Зарегистрироваться"),
  };
}
