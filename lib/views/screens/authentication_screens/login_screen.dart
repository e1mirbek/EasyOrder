// ignore: unused_import
import 'dart:developer' as dev;
import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_routes.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/views/screens/authentication_screens/register_screen.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/account_query_row.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/language_selector/language_selector.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/welcome_Illustration.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/header_section.dart';
import 'package:easy_order/views/widgets/custom_button.dart';
import 'package:easy_order/views/screens/authentication_screens/widgets/labeled_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
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
                          label: S.of(context).emailLabel,
                          hintText: S.of(context).emailHint,
                          prefixIcon: AppAssets.emaiIcon,
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),
                        LabeledTextField(
                          label: S.of(context).passwordLabel,
                          hintText: S.of(context).passwordHint,
                          prefixIcon: AppAssets.passwordIcon,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                          ),
                          obscureText: _isObscure,
                        ),
                        const SizedBox(height: AppSizes.spaceMedium),
                        // --- ACTION BUTTONS ---
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 25.0,
                          ),
                          child: CustomButton(
                            onPressed: () => dev.log('open the page'),
                            title: S.of(context).signUp,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),
                        // --- NAVIGATION LINKS ---
                        AccountQueryRow(
                          onTap: () =>
                              Navigator.pushNamed(context, AppRoutes.register),
                          text: S.of(context).alreadyHaveAccount,
                          linkText: S.of(context).signUp,
                        ),
                      ],
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
