import 'package:easy_order/generated/l10n.dart';
import 'package:flutter/material.dart';

class AppValidator {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  static final _passwordValidate = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static final _nameValidate = RegExp(r"^[a-zA-Zа-яА-ЯёЁ\s'-]+$");

  // email validate

  static String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return S.of(context).emailRequired;
    }

    if (!_emailRegExp.hasMatch(value)) {
      return S.of(context).emailInvalid;
    }
    if (value.length > 50) {
      return 'Ваше gmail слишком длинное';
    }

    return null;
  }

  // password validate

  static String? validatePassword(
    String? value,
    BuildContext context, {
    String? originalPassword, // Делаем именованным и необязательным
  }) {
    if (value == null || value.isEmpty) {
      return S.of(context).passwordRequired;
    }

    if (!_passwordValidate.hasMatch(value)) {
      return S.of(context).passwordTooShort;
    }

    // Если мы передали originalPassword (значит это поле "Повторите пароль")
    if (originalPassword != null && value != originalPassword) {
      return 'Пароли не совпадают';
    }

    return null;
  }

  // email validate

  static String? validateName(String? value, BuildContext context) {
    if (value == null || value.trim().isEmpty) {
      return S.of(context).fullNameRequired;
    }
    if (value.trim().length < 2) {
      return S.of(context).fullNameTooShort;
    }

    if (!_nameValidate.hasMatch(value)) {
      return S.of(context).fullNameTooShort;
    }
    return null;
  }

  // Регулярка для кыргызских номеров (9 цифр после кода страны)
  static final _phoneRegExp = RegExp(r'^\+996\d{9}$');
  static String? validatePhone(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return 'Введите номер телефона';
    }

    // Убираем лишние пробелы и скобки перед проверкой
    final cleanPhone = value.replaceAll(RegExp(r'[^\d+]'), '');
    if (!_phoneRegExp.hasMatch(cleanPhone)) {
      return 'Неверный формат (+996XXXXXXXXX)';
    }
    return null;
  }
}
