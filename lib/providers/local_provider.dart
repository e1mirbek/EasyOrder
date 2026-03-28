import 'package:easy_order/controllers/local_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localControllerProvider = NotifierProvider<LocalController, Locale>(() {
  return LocalController();
});
