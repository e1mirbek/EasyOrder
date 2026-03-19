import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String title;
  final String subtitle;
  const HeaderSection({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: AppTextStyles.title),
        const SizedBox(height: AppSizes.spaceSmall),
        Text(
          subtitle,
          style: AppTextStyles.subtitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
