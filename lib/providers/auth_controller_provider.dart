
import 'package:easy_order/controllers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final authControllerProvider = NotifierProvider <AuthController, NotifierProvider<void>>() => AuthController();

final authControllerProvider = NotifierProvider<AuthController, AsyncValue<void>>(() {
  return AuthController();
});