import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:easy_order/core/widgets/lodaer/app_loader.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final bool isLoading;
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(foregroundColor: AppColors.white),
      onPressed: isLoading ? null : onPressed,
      child: Center(
        child: isLoading
            ? const AppLoader(
                size: 18.0,
                strokeWidth: 15.0,
                color: AppColors.white,
              )
            : Text(title, style: AppTextStyles.buttontitle),
      ),
    );
  }
}
