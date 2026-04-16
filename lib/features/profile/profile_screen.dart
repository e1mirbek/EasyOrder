import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/widgets/lodaer/app_loader.dart';
import 'package:easy_order/features/auth/controllers/auth_controller.dart';
import 'package:easy_order/features/settings/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        actions: [
          IconButton(
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: user.when(
        data: (userData) {
          final email = userData?.email;
          final name = userData?.fullName;
          final createdAtText = userData?.createdAt == null
              ? 'Дата регистрации обновляется...'
              : DateFormat('dd.MM.yyyy, HH:mm').format(userData!.createdAt!);
          if (userData == null) {
            return Center(child: Text('User не зарегистрировался'));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const SizedBox(height: 8),
              const CircleAvatar(radius: 36, child: Icon(Icons.person)),
              const SizedBox(height: 16),
              Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.badge_outlined),
                      title: const Text('Имя'),
                      subtitle: Text(userData.fullName),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.email_outlined),
                      title: const Text('Email'),
                      subtitle: Text(userData.email),
                    ),
                    const Divider(height: 1),
                    ListTile(
                      leading: const Icon(Icons.calendar_today_outlined),
                      title: const Text('Дата регистрации'),
                      subtitle: Text(createdAtText),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        error: (err, stack) => const Center(child: Text('Ошибка !!!')),
        loading: () => Center(
          child: AppLoader(
            size: 20.0,
            strokeWidth: 2.0,
            color: AppColors.buttonBlue,
          ),
        ),
      ),
    );
  }
}
