// ignore: unused_import
import 'dart:developer' as dev;
import 'package:easy_order/core/constants/app_assets.dart';
import 'package:easy_order/core/constants/app_sizes.dart';
import 'package:easy_order/core/theme/app_colors.dart';
import 'package:easy_order/core/utils/app_validator.dart';
import 'package:easy_order/features/auth/controllers/auth_controller.dart';
import 'package:easy_order/generated/l10n.dart';
import 'package:easy_order/features/auth/views/widgets/account_query_row.dart';
import 'package:easy_order/features/auth/views/widgets/language_selector/language_selector.dart';
import 'package:easy_order/features/auth/views/widgets/header/welcome_Illustration.dart';
import 'package:easy_order/features/auth/views/widgets/header/header_section.dart';
import 'package:easy_order/core/custom_widgets/custom_button.dart';
import 'package:easy_order/features/auth/views/widgets/fields/labeled_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  ValueNotifier<bool> isObscureNotifier = ValueNotifier<bool>(true);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    isObscureNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    // 2. Слушаем ошибки для показа SnackBar
    ref.listen<AsyncValue<void>>(authControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error.toString()),
              backgroundColor: AppColors.error,
            ),
          );
        },
      );
    });
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.screenPadding),
                child: Form(
                  key: _formkey,
                  child: Center(
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
                          title: S.of(context).loginTitle,
                          subtitle: S.of(context).loginSubtitle,
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),
                        const WelcomeIllustration(
                          welcomeImgIllu: AppAssets.welcomeIllu,
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),
                        // --- FORM FIELDS ---
                        LabeledTextField(
                          controller: _emailController,
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
                              controller: _passwordController,
                              validator: (value) =>
                                  AppValidator.validatePassword(value, context),
                              label: S.of(context).passwordLabel,
                              hintText: S.of(context).passwordHint,
                              prefixIcon: AppAssets.passwordIcon,
                              suffixIcon: IconButton(
                                onPressed: () {
                                  isObscureNotifier.value =
                                      !isObscureNotifier.value;
                                  dev.log(
                                    'Password visibility toggled: $isObscureNotifier.value',
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
                                ref
                                    .read(authControllerProvider.notifier)
                                    .login(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    );
                              }
                            },
                            title: S.of(context).signIn,
                            isLoading: authState.isLoading,
                          ),
                        ),
                        const SizedBox(height: AppSizes.spaceSmall),
                        // --- NAVIGATION LINKS ---
                        AccountQueryRow(
                          onTap: () => context.go('/register'),
                          text: S.of(context).dontHaveAccount,
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
