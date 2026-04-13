import 'package:easy_order/features/home/views/widgets/banner/home_banner.dart';
import 'package:easy_order/features/home/views/widgets/header/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          const HomeHeader(),
          SizedBox(height: 170.0, child: HomeBanner()),
        ],
      ),
    );
  }
}
