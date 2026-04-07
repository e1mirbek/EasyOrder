import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/features/cart/cart_screen.dart';
import 'package:easy_order/features/favorite/favorite_screen.dart';
import 'package:easy_order/features/home/views/home_screen.dart';
import 'package:easy_order/features/navigation/provider/navigation_Index_provider.dart';
import 'package:easy_order/features/profile/profile_screen.dart';
import 'package:easy_order/features/shop/shop_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navigationIndexProvider);

    final List<Widget> screens = [
      const HomeScreen(),
      const FavoriteScreen(),
      const ShopScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(index: index, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) =>
            ref.read(navigationIndexProvider.notifier).state = value,
        type: BottomNavigationBarType.fixed, // Чтобы иконки не "прыгали"
        selectedItemColor: AppColors.primary, // Твой розовый/красный цвет
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Избранное',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Магазин'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
        ],
      ),
    );
  }
}
