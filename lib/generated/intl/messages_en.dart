// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  // ignore: strict_top_level_inference
  static String m0(errorCode) => "Server error: ${errorCode}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "alreadyHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "dontHaveAccount": MessageLookupByLibrary.simpleMessage(
      "Don’t have an account?",
    ),
    "emailAlreadyInUse": MessageLookupByLibrary.simpleMessage(
      "This email is already in use",
    ),
    "emailHint": MessageLookupByLibrary.simpleMessage("Enter your email"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Please enter a valid email address",
    ),
    "emailLabel": MessageLookupByLibrary.simpleMessage("Email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter your email",
    ),
    "fullNameHint": MessageLookupByLibrary.simpleMessage(
      "Enter your full name",
    ),
    "fullNameLabel": MessageLookupByLibrary.simpleMessage("Full Name"),
    "fullNameRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter your full name",
    ),
    "fullNameTooShort": MessageLookupByLibrary.simpleMessage(
      "Name must be at least 2 characters",
    ),
    "languageName": MessageLookupByLibrary.simpleMessage("English"),
    "loginSubtitle": MessageLookupByLibrary.simpleMessage(
      "Discover exclusive global deals.",
    ),
    "loginTitle": MessageLookupByLibrary.simpleMessage("Welcome back!"),
    "networkError": MessageLookupByLibrary.simpleMessage(
      "Check your internet connection",
    ),
    "onlyLettersName": MessageLookupByLibrary.simpleMessage(
      "Only letters allowed",
    ),
    "passwordHint": MessageLookupByLibrary.simpleMessage("Enter your password"),
    "passwordLabel": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordRequired": MessageLookupByLibrary.simpleMessage(
      "Please enter your password",
    ),
    "passwordTooShort": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "registerSubTitle": MessageLookupByLibrary.simpleMessage(
      "Join us and start using the app",
    ),
    "registerTitle": MessageLookupByLibrary.simpleMessage(
      "Create your account",
    ),
    "serverError": m0,
    "signIn": MessageLookupByLibrary.simpleMessage("Sign in"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "userNotFound": MessageLookupByLibrary.simpleMessage("User not found"),
    "wrongPassword": MessageLookupByLibrary.simpleMessage("Incorrect password"),
  };
}
