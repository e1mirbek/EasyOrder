import 'package:easy_order/controllers/providers/local_provider.dart';
import 'package:easy_order/core/constants/app_routes.dart';
import 'package:easy_order/core/theme/app_theme.dart';
import 'package:easy_order/firebase_options.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/views/screens/auth/login_screen.dart';
import 'package:easy_order/views/screens/auth/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localControllerProvider);
    return MaterialApp(
      title: 'Easy Order',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
      },
      locale: locale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ru', ''),
        Locale('ky', ''),
      ],
    );
  }
}
