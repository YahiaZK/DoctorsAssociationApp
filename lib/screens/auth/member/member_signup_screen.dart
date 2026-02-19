import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/components/app_button.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/components/gradient_text.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/providers/auth_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

extension StringCasingExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}

class MemberSignupScreen extends ConsumerStatefulWidget {
  const MemberSignupScreen({super.key});

  @override
  ConsumerState<MemberSignupScreen> createState() => _MemberSignupScreenState();
}

class _MemberSignupScreenState extends ConsumerState<MemberSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (!_formKey.currentState!.validate()) return;
    ref
        .read(authControllerProvider.notifier)
        .signUp(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          firstName: firstNameController.text.trim().capitalize(),
          lastName: lastNameController.text.trim().capitalize(),
        );
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
              AppLocalizations.of(context)!.signup,
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
                    Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.firstName,
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: firstNameController,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.firstNameRequired;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Ahmad',
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
                          AppLocalizations.of(context)!.lastName,
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: lastNameController,
                          autocorrect: false,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.lastNameRequired;
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Mohammad',
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
                            if (value.length < 8) {
                              return AppLocalizations.of(
                                context,
                              )!.passwordMinLength;
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return AppLocalizations.of(
                                context,
                              )!.passwordUppercase;
                            }
                            if (!RegExp(r'[a-z]').hasMatch(value)) {
                              return AppLocalizations.of(
                                context,
                              )!.passwordLowercase;
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return AppLocalizations.of(
                                context,
                              )!.passwordNumber;
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
                        Text(
                          AppLocalizations.of(context)!.confirmPassword,
                          style: TextStyle(fontSize: 20),
                        ),
                        TextFormField(
                          controller: confirmPasswordController,
                          autocorrect: false,
                          obscureText: _obscureConfirmPassword,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return AppLocalizations.of(
                                context,
                              )!.pleaseConfirmPassword;
                            }
                            if (value != passwordController.text.trim()) {
                              return AppLocalizations.of(
                                context,
                              )!.passwordsDoNotMatch;
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
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: AppColors.textColorGray,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
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
                      ],
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: AppButton(
                        onPressed: _signUp,
                        gradient: AppColors.mainGradient,
                        child: Text(
                          AppLocalizations.of(context)!.signup,
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
                        Text(AppLocalizations.of(context)!.haveAccount),
                        GestureDetector(
                          onTap: () => context.pop(),
                          child: GradientText(
                            AppLocalizations.of(context)!.login,
                            gradient: AppColors.mainGradient,
                          ),
                        ),
                      ],
                    ),
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
