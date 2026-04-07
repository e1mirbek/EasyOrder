import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class WelcomeIllustration extends StatelessWidget {
  final String welcomeImgIllu;
  const WelcomeIllustration({super.key, required this.welcomeImgIllu});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      welcomeImgIllu,
      height: AppSizes.welcomeImageSize,
      width: AppSizes.welcomeImageSize,
    );
  }
}
