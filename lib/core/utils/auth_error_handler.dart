class AuthErrorHandler {
  static String mapFirebaseError(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Эта почта уже занята другим пользователем';
      case 'invalid-email':
        return 'Некорректный формат почты';
      case 'weak-password':
        return 'Пароль слишком слабый';
      case 'user-not-found':
        return 'Пользователь с таким email не найден';
      case 'wrong-password':
        return 'Неверный пароль';
      case 'user-disabled':
        return 'Этот аккаунт был заблокирован';
      case 'too-many-requests':
        return 'Слишком много попыток. Попробуйте позже';
      case 'network-request-failed':
        return 'Проблемы с интернет-соединением';
      default:
        return 'Произошла ошибка (код: $code)';
    }
  }
}
