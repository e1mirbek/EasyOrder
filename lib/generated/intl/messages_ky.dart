// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ky locale. All the
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
  String get localeName => 'ky';

  static String m0(code) => "Ошибка сервера: ${code}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Аккаунтуңуз барбы?",
    ),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Аккаунтуңуз жокпу?",
    ),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "Эта почта уже занята",
    ),
    "emailHint": MessageLookupByLibrary.simpleMessage(
      "Электрондук почтаңызды киргизиңиз",
    ),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Туура email дарегин киргизиңиз",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Электрондук почта"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Электрондук почтаңызды киргизиңиз",
    ),
    "fullNameHint": MessageLookupByLibrary.simpleMessage(
      "Толук аты-жөнүңүздү киргизиңиз",
    ),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("Толук аты-жөнү"),
    "fullNameRequired": MessageLookupByLibrary.simpleMessage(
      "Толук аты-жөнүңүздү киргизиңиз",
    ),
    "fullNameTooShort": MessageLookupByLibrary.simpleMessage(
      "Аты кеминде 2 белгиден турушу керек",
    ),
    "languageName": MessageLookupByLibrary.simpleMessage("Кыргызча"),
    "loginSubtitle": MessageLookupByLibrary.simpleMessage(
      "Дүйнөлүк өзгөчө сунуштарды өзүңүз үчүн ачыңыз.",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage("Аккаунтуңузга кириңиз"),
    "networkError": MessageLookupByLibrary.simpleMessage(
      "Проверьте интернет-соединение",
    ),
    "onlyLettersName": MessageLookupByLibrary.simpleMessage("Тамгалар гана"),
    "passwordHint": MessageLookupByLibrary.simpleMessage("Сырсөздү киргизиңиз"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Сырсөз"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Сырсөздү киргизиңиз",
    ),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Сырсөз кеминде 6 белгиден турушу керек",
    ),
    "registerSubTitle": MessageLookupByLibrary.simpleMessage(
      "Бизге кошулуп, колдонмону колдоно баштаңыз",
    ),
    "registerTitle": MessageLookupByLibrary.simpleMessage("Аккаунт түзүңүз"),
    "serverError": m0,
    "signIn": MessageLookupByLibrary.simpleMessage("Кирүү"),
    "signUp": MessageLookupByLibrary.simpleMessage("Катталуу"),
    "userNotFound": MessageLookupByLibrary.simpleMessage(
      "Пользователь не найден",
    ),
    "wrongPassword": MessageLookupByLibrary.simpleMessage("Неверный пароль"),
  };
}
