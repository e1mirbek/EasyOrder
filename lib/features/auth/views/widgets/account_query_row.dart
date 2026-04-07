import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AccountQueryRow extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final String linkText;
  const AccountQueryRow({
    super.key,
    this.onTap,
    required this.text,
    required this.linkText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          text: text,
          style: AppTextStyles.subtitle,
          children: [
            TextSpan(
              text: linkText,
              style: AppTextStyles.subtitle.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
