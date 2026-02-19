import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/components/app_button.dart';
import 'package:doctors_association_app/components/gradient_text.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const Spacer(),
              const Spacer(),
              Image(image: AssetImage("assets/images/DAlogo.png")),
              const SizedBox(height: 30),
              Column(
                spacing: 0,
                children: [
                  GradientText(
                    AppLocalizations.of(context)!.doctors,
                    gradient: AppColors.mainGradient,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                  GradientText(
                    AppLocalizations.of(context)!.associ,
                    gradient: AppColors.mainGradient,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              Text(
                AppLocalizations.of(context)!.welcomeScreenText,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Column(
                spacing: 10,
                children: [
                  AppButton(
                    onPressed: () => context.push('/member-login'),
                    gradient: AppColors.mainGradient,
                    child: Text(
                      AppLocalizations.of(context)!.member,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  AppButton(
                    onPressed: () => context.push("/guest-login"),
                    color: AppColors.buttonBackgroundColor,
                    child: GradientText(
                      AppLocalizations.of(context)!.notMember,
                      gradient: AppColors.mainGradient,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
