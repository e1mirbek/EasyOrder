import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomTextField({
    super.key,
    this.labelText,
    required this.prefixIcon,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);
    final commonBorder = OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide.none,
    );
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        border: commonBorder,
        focusedBorder: commonBorder,
        enabledBorder: commonBorder,
        errorBorder: commonBorder,
        disabledBorder: commonBorder,
        hintText: hintText,
        labelText: labelText,
        labelStyle: AppTextStyles.inputLabel,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            prefixIcon,
            height: AppSizes.fieldIconSize,
            width: AppSizes.fieldIconSize,
          ),
        ),
        suffixIcon: suffixIcon,
        prefixIconConstraints: BoxConstraints(minHeight: 40.0, minWidth: 40.0),
      ),
    );
  }
}
