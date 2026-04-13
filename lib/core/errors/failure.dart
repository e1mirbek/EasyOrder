import 'package:firebase_core/firebase_core.dart';

class Failure {
  final String message;
  final String? code;

  const Failure(this.message, {this.code});

  // Умный конструктор для обработки ошибок Firebase и не только (например, ошибки сети, базы данных и т.д.)
  factory Failure.fromException(Object exception) {
    if (exception is FirebaseException) {
      return Failure(_mapFirestoreError(exception.code), code: exception.code);
    }
    return Failure('Неизвестная ошибка: ${exception.toString()}');
  }

  // Маппинг ошибок для базы данных (баннеры, товары, профиль)
  static String _mapFirestoreError(String code) {
    switch (code) {
      case 'permission-denied':
        return 'У вас нет прав для доступа к этим данным';
      case 'unavailable':
        return 'Сервер временно недоступен. Проверьте интернет';
      case 'not-found':
        return 'Запрашиваемые данные не найдены';
      case 'deadline-exceeded':
        return 'Время ожидания истекло. Попробуйте еще раз';
      default:
        return 'Ошибка базы данных (код: $code)';
    }
  }

  @override
  String toString() => message;
}

class AuthFailure extends Failure {
  const AuthFailure(super.message, {super.code});
}
