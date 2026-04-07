import 'package:easy_order/features/auth/controllers/auth_controller.dart';
import 'package:easy_order/features/settings/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: userData.when(
          data: (data) {
            if (data == null) return const Text('Пользователь не найден');
            final String name = data.fullName;
            final String email = data.email;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Добро пожаловать, $name!'),
                Text('Ваш email: $email'),
              ],
            );
          },
          error: (error, state) => Text('Ошибка загрузкий $error'),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
