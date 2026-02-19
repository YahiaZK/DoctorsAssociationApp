import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/components/app_button.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/components/gradient_text.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/providers/auth_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class MemberLoginScreen extends ConsumerStatefulWidget {
  const MemberLoginScreen({super.key});

  @override
  ConsumerState<MemberLoginScreen> createState() => _MemberLoginScreenState();
}

class _MemberLoginScreenState extends ConsumerState<MemberLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!_formKey.currentState!.validate()) return;
    ref
        .read(authControllerProvider.notifier)
        .login(emailController.text.trim(), passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    ref.listen<AsyncValue<void>>(authControllerProvider, (previous, next) {
      next.whenOrNull(
        error: (error, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(error.toString())));
        },
      );
    });

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.screenBackgroundColor,
          appBar: CustomAppBar(
            title: Text(
              AppLocalizations.of(context)!.login,
              style: TextStyle(
                color: AppColors.textColorWhite,
                fontWeight: FontWeight.w600,
                fontSize: 24,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GradientText(
                      AppLocalizations.of(context)!.loginWelcome,
                      gradient: AppColors.mainGradient,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(AppLocalizations.of(context)!.loginWelcomeText),
                    SizedBox(height: 32),
                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.email,
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: emailController,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.emailRequired;
                            }
                            final emailRegex = RegExp(
                              r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                            );
                            if (!emailRegex.hasMatch(value)) {
                              return AppLocalizations.of(context)!.invalidEmail;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'example@example.com',
                            hintStyle: TextStyle(
                              color: AppColors.textColorGray,
                            ),
                            filled: true,
                            fillColor: AppColors.fieldColor,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.password,
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: passwordController,
                          autocorrect: false,
                          obscureText: _obscurePassword,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.passwordRequired;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hintText: '••••••••',
                            hintStyle: TextStyle(
                              color: AppColors.textColorGray,
                              fontSize: 18,
                            ),
                            fillColor: AppColors.fieldColor,
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.textColorGray,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: GestureDetector(
                            onTap: () => context.push('/forget-password'),
                            child: GradientText(
                              AppLocalizations.of(context)!.forgetPassword,
                              gradient: AppColors.mainGradient,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: AppButton(
                        onPressed: _login,
                        gradient: AppColors.mainGradient,
                        child: Text(
                          AppLocalizations.of(context)!.login,
                          style: TextStyle(
                            color: AppColors.textColorWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 4,
                      children: [
                        Text(AppLocalizations.of(context)!.dontHaveAccount),
                        GestureDetector(
                          onTap: () => context.push('/member-signup'),
                          child: GradientText(
                            AppLocalizations.of(context)!.signup,
                            gradient: AppColors.mainGradient,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (authState.isLoading)
          Container(
            color: Colors.black.withAlpha(128),
            child: const Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}
