// ignore: unused_import
import 'dart:developer' as dev;
import 'package:easy_order/controllers/auth_controller.dart';
import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_routes.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/utils/app_validator.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/views/screens/auth/widgets/account_query_row.dart';
import 'package:easy_order/views/screens/auth/widgets/language_selector/language_selector.dart';
import 'package:easy_order/views/screens/auth/widgets/header/welcome_Illustration.dart';
import 'package:easy_order/views/screens/auth/widgets/header/header_section.dart';
import 'package:easy_order/views/widgets/custom_button.dart';
import 'package:easy_order/views/screens/auth/widgets/fields/labeled_text_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController authController = AuthController();

  late String email;
  late String fullName;
  late String password;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isObscureNotifier = ValueNotifier<bool>(true);
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.screenPadding),
                  child: IntrinsicHeight(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // --- LANGUAGE SELECTION ---
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [const LanguageSelector()],
                          ),

                          // --- HEADER & ILLUSTRATION ---
                          const SizedBox(height: AppSizes.spaceLarge),
                          HeaderSection(
                            title: S.of(context).registerTitle,
                            subtitle: S.of(context).registerSubTitle,
                          ),
                          const SizedBox(height: AppSizes.spaceSmall),
                          const WelcomeIllustration(
                            welcomeImgIllu: AppAssets.welcomeIllu,
                          ),
                          const SizedBox(height: AppSizes.spaceSmall),
                          // --- FORM FIELDS ---
                          LabeledTextField(
                            onChanged: (value) => email = value,
                            validator: (value) =>
                                AppValidator.validateEmail(value, context),
                            label: S.of(context).emailLabel,
                            hintText: S.of(context).emailHint,
                            prefixIcon: AppAssets.emaiIcon,
                          ),
                          const SizedBox(height: AppSizes.spaceSmall),
                          LabeledTextField(
                            onChanged: (value) => fullName = value,
                            validator: (value) =>
                                AppValidator.validateName(value, context),
                            label: S.of(context).fullNameLabel,
                            hintText: S.of(context).fullNameHint,
                            prefixIcon: AppAssets.userIcon,
                          ),
                          const SizedBox(height: AppSizes.spaceSmall),
                          ValueListenableBuilder(
                            valueListenable: isObscureNotifier,
                            builder: (context, isObscure, child) {
                              return LabeledTextField(
                                onChanged: (value) => password = value,
                                validator: (value) =>
                                    AppValidator.validatePassword(
                                      value,
                                      context,
                                    ),
                                label: S.of(context).passwordLabel,
                                hintText: S.of(context).passwordHint,
                                prefixIcon: AppAssets.passwordIcon,
                                suffixIcon: IconButton(
                                  onPressed: () => isObscureNotifier.value =
                                      !isObscureNotifier.value,
                                  icon: Icon(
                                    isObscure
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                  ),
                                ),
                                obscureText: isObscure,
                              );
                            },
                          ),

                          const SizedBox(height: AppSizes.spaceMedium),
                          // --- ACTION BUTTONS ---
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 25.0,
                            ),
                            child: CustomButton(
                              onPressed: () async {
                                if (_formkey.currentState!.validate()) {
                                  final result = await authController
                                      .registerNewUser(
                                        email,
                                        fullName,
                                        password,
                                      );
                                  if (result != 'success') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(result),
                                        backgroundColor: AppColors.error,
                                      ),
                                    );
                                  }
                                } else {
                                  dev.log('validation failed');
                                  dev.log('email: $email');
                                  dev.log('fullName: $fullName');
                                  dev.log('password: $password');
                                }
                              },
                              title: S.of(context).signUp,
                            ),
                          ),
                          const SizedBox(height: AppSizes.spaceSmall),
                          // --- NAVIGATION LINKS ---
                          AccountQueryRow(
                            onTap: () =>
                                Navigator.pushNamed(context, AppRoutes.login),
                            text: S.of(context).alreadyHaveAccount,
                            linkText: S.of(context).signIn,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
