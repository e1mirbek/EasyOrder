import 'package:easy_order/features/auth/controllers/auth_controller.dart';
import 'package:easy_order/features/profile/providers/user_provider.dart'; // Импортируй созданный провайдер
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Слушаем данные пользователя
    final userData = ref.watch(userDataProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Order'),
        actions: [
          // Кнопка выхода (для тестов)
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              ref.read(authControllerProvider.notifier).logout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: Center(
        child: userData.when(
          // Когда данные пришли из Firestore
          data: (data) {
            if (data == null) return const Text('Пользователь не найден');

            final String name = data.fullName;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Добро пожаловать,',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  name,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            );
          },
          // Пока данные грузятся
          loading: () => const CircularProgressIndicator(),
          // Если произошла ошибка (например, нет интернета)
          error: (e, st) => Text('Ошибка загрузки: $e'),
        ),
      ),
    );
  }
}
