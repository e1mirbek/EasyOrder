// lib/features/home/widgets/home_header.dart
import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/widgets/fields/custom_text_field.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final double headerHeight = MediaQuery.of(context).size.height * 0.20;

    return Stack(
      children: [
        Image.asset(
          AppAssets.homeHeaderIllu,
          width: MediaQuery.of(context).size.width,
          height: headerHeight,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: const CustomTextField(
                      hintText: 'Поиск',
                      prefixIcon: AppAssets.searchIcon,
                    ),
                  ),
                  SizedBox(width: AppSizes.spaceMedium),
                  Icon(Icons.notifications_outlined, color: AppColors.white),
                  SizedBox(width: AppSizes.spaceMedium),
                  Icon(Icons.chat_outlined, color: AppColors.white),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
