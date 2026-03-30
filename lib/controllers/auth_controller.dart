import 'package:easy_order/data/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// AsyncValue - У него есть три состояния «из коробки»:

/// loading: (Загрузка) — крутим индикатор.

/// error: (Ошибка) — показываем красный текст.

/// data: (Данные) — показываем результат.

class AuthController extends Notifier<AsyncValue<void>> {
  @override
  AsyncValue<void> build() {
    // Начальное состояние: данных нет, ошибок нет, загрузки нет.
    return const AsyncValue.data(null);
  }

  Future<void> register(String email, String password, String fullName) async {
    // в процессе регистрации (загрузка)
    state = const AsyncLoading();

    // Мы обращаемся к репозиторию через ref.read

    state = await AsyncValue.guard(
      () => ref.read(authRepositoryProvider).signUp(email, fullName, password),
    );
  }
}
