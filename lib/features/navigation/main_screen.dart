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

  static const List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
    ShopScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(navigationIndexProvider);
    return Scaffold(
      // IndexedStack сохраняет состояние всех вкладок (скролл, введенный текст)
      body: IndexedStack(index: index, children: _screens),
      bottomNavigationBar: _buildBottomNavBar(index, ref),
    );
  }

  Widget _buildBottomNavBar(int index, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: index,
        onTap: (value) =>
            ref.read(navigationIndexProvider.notifier).state = value,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        backgroundColor: AppColors.white,
        items: [
          _buildBottomNavBarItem(Icons.home, Icons.home, 'Главная'),
          _buildBottomNavBarItem(Icons.favorite, Icons.favorite, 'Избранное'),
          _buildBottomNavBarItem(Icons.store, Icons.store, 'Магазин'),
          _buildBottomNavBarItem(
            Icons.shopping_cart,
            Icons.shopping_cart,
            'Корзина',
          ),
          _buildBottomNavBarItem(Icons.person, Icons.person, 'Профиль'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
    IconData icon,
    IconData activeIcon,
    String label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      label: label,
    );
  }
}
