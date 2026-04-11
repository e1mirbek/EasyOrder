import 'package:easy_order/features/auth/providers/auth_state_provider.dart';
import 'package:easy_order/features/auth/views/login_screen.dart';
import 'package:easy_order/features/auth/views/register_screen.dart';
import 'package:easy_order/features/cart/cart_screen.dart';
import 'package:easy_order/features/favorite/favorite_screen.dart';
import 'package:easy_order/features/navigation/main_screen.dart';
import 'package:easy_order/features/home/views/home_screen.dart';
import 'package:easy_order/features/profile/profile_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/main',
    redirect: (context, state) {
      final user = authState.value;
      // final isLoginIn =
      //     state.matchedLocation == '/login' ||
      //     state.matchedLocation == '/register';

      // Если пользователь не залогинен и пытается попасть на страницу, отличную от логина или регистрации, перенаправляем его на страницу логина
      // if (user == null) {
      //   return isLoginIn ? null : '/login';
      // }

      // // Если пользователь залогинен и пытается попасть на страницу логина или регистрации, перенаправляем его на главную страницу
      // if (isLoginIn) {
      //   return '/main';
      // }
      // return null;
    },
    routes: <RouteBase>[
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/main',
        name: 'main',
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/favorite',
        name: 'favorite',
        builder: (context, state) => const FavoriteScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
    ],
  );
});
