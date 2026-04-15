import 'package:easy_order/features/home/providers/categories_provider.dart';
import 'package:easy_order/features/home/views/widgets/banner/home_banner.dart';
import 'package:easy_order/features/home/views/widgets/category/category_widget.dart';
import 'package:easy_order/features/home/views/widgets/header/home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(categoriesProvider);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // header
                HomeHeader(
                  onNotificationsTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Экран уведомлений в разработке'),
                      ),
                    );
                  },
                  onChatTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Экран чата в разработке')),
                    );
                  },
                ),
                // banner
                const HomeBanner(),
                const CategoryWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
