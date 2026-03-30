// ignore: unused_import
import 'dart:developer' as dev;
import 'package:easy_order/controllers/auth_controller.dart';
import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_routes.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/utils/app_validator.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/views/screens/auth/widgets/account_query_row.dart';
import 'package:easy_order/views/screens/auth/widgets/language_selector/language_selector.dart';
import 'package:easy_order/views/screens/auth/widgets/header/welcome_Illustration.dart';
import 'package:easy_order/views/screens/auth/widgets/header/header_section.dart';
import 'package:easy_order/views/widgets/custom_button.dart';
import 'package:easy_order/views/screens/auth/widgets/fields/labeled_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final AuthController authController = AuthController();
  late String email;
  late String password;
  late String fullName;
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isObscureNotifier = ValueNotifier<bool>(true);
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
                            children: [LanguageSelector()],
                          ),

                          // --- HEADER & ILLUSTRATION ---
                          const SizedBox(height: AppSizes.spaceLarge),
                          HeaderSection(
                            title: S.of(context).loginSubtitle,
                            subtitle: S.of(context).loginSubtitle,
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
                                  onPressed: () {
                                    isObscureNotifier.value =
                                        !isObscureNotifier.value;
                                    dev.log(
                                      'Password visibility toggled: $isObscureNotifier',
                                    );
                                  },
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
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  authController.registerNewUser(
                                    email,
                                    fullName,
                                    password,
                                  );
                                  dev.log('success');
                                  dev.log('email: $email');
                                  dev.log('password: $password');
                                }
                              },
                              title: S.of(context).signUp,
                            ),
                          ),
                          const SizedBox(height: AppSizes.spaceSmall),
                          // --- NAVIGATION LINKS ---
                          AccountQueryRow(
                            onTap: () => Navigator.pushNamed(
                              context,
                              AppRoutes.register,
                            ),
                            text: S.of(context).alreadyHaveAccount,
                            linkText: S.of(context).signUp,
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
