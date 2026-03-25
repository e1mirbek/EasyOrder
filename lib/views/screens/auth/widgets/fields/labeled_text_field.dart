import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:easy_order/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final String prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.fieldLabel),
        const SizedBox(height: AppSizes.spaceSmall),
        CustomTextField(
          validator: validator,
          labelText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          obscureText: obscureText,
        ),
      ],
    );
  }
}
