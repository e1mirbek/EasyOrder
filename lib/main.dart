import 'package:easy_order/core/constants/app_routes.dart';
import 'package:easy_order/core/theme/app_theme.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/controllers/providers/language_provider.dart';
import 'package:easy_order/views/screens/authentication_screens/login_screen.dart';
import 'package:easy_order/views/screens/authentication_screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LanguageProvider())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageController = Provider.of<LanguageProvider>(context);
    return MaterialApp(
      // --- Основные настройки ---
      title: 'Easy Order',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      // --- Навигация ---
      initialRoute: AppRoutes.login,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
      },
      // --- Локализация ---
      locale: languageController.appLocale,
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
