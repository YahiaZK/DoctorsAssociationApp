import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/components/gradient_text.dart';
import 'package:doctors_association_app/components/news_carousel.dart';
import 'package:doctors_association_app/components/service_card.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/providers/user_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final userName = userAsync.when(
      data: (user) =>
          user != null ? 'Dr.${user.firstName} ${user.lastName}' : '',
      loading: () => '',
      error: (_, _) => '',
    );
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      spacing: 10,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage(
                            'assets/images/profile-picture1.jpg',
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientText(
                              AppLocalizations.of(context)!.hiWelcome,
                              gradient: AppColors.mainGradient,
                            ),
                            Text(userName),
                          ],
                        ),
                      ],
                    ),

                    Row(
                      textDirection: TextDirection.rtl,
                      spacing: 5,
                      children: [
                        GestureDetector(
                          onTap: () => context.go('/profile'),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.buttonBackgroundColor,
                            child: SvgPicture.asset(
                              'assets/icons/settings.svg',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.push('/profile/notifications'),
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: AppColors.buttonBackgroundColor,
                            child: SvgPicture.asset(
                              'assets/icons/notification.svg',
                              width: 20,
                              height: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(color: AppColors.buttonBackgroundColor),
              SizedBox(height: 20),
              const NewsCarousel(),

              SizedBox(height: 50),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText(
                      AppLocalizations.of(context)!.quickServices,
                      gradient: AppColors.mainGradient,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    GestureDetector(
                      onTap: () => context.push('/services'),
                      child: GradientText(
                        AppLocalizations.of(context)!.seeAll,
                        gradient: AppColors.mainGradient,
                      ),
                    ),
                  ],
                ),
              ),

              Divider(color: AppColors.buttonBackgroundColor),

              Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ServiceCard(
                      iconPath: 'assets/icons/membership_certificate.svg',
                      title: AppLocalizations.of(
                        context,
                      )!.membershipCertificate,
                      onPressed: () =>
                          context.go('/services/membership-certificate'),
                    ),
                    ServiceCard(
                      iconPath: 'assets/icons/badge.svg',
                      title: AppLocalizations.of(context)!.doctorsBadge,
                      onPressed: () => context.go('/services/doctors-badge'),
                    ),
                    ServiceCard(
                      iconPath: 'assets/icons/card.svg',
                      title: AppLocalizations.of(context)!.doctorsCard,
                      onPressed: () => context.go('/services/doctors-card'),
                    ),
                    ServiceCard(
                      iconPath: 'assets/icons/continuous_learning.svg',
                      title: AppLocalizations.of(context)!.continuousLearning,
                      onPressed: () =>
                          context.go('/services/continuous-learning'),
                    ),
                    ServiceCard(
                      iconPath: 'assets/icons/job.svg',
                      title: AppLocalizations.of(context)!.searchJob,
                      onPressed: () => context.go('/services/search-job'),
                    ),
                    ServiceCard(
                      iconPath: 'assets/icons/complaint.svg',
                      title: AppLocalizations.of(context)!.complaints,
                      onPressed: () => context.go('/services/complaints'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
