import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/components/app_button.dart';
import 'package:doctors_association_app/components/checkmark_row.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/components/custom_container.dart';
import 'package:doctors_association_app/components/gradient_text.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/providers/user_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class DoctorsCardScreen extends ConsumerWidget {
  const DoctorsCardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(currentUserProvider);
    final userName = userAsync.when(
      data: (user) => user != null ? "${user.firstName} ${user.lastName}" : '',
      loading: () => '',
      error: (_, _) => '',
    );
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          AppLocalizations.of(context)!.requestCard,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(23),
          child: Center(
            child: Column(
              spacing: 15,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 286,
                      height: 172,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/images/card.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.cardPreviewBackground,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.cardPreview,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),

                CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.doctorsCardTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: AppLocalizations.of(
                                context,
                              )!.cardDescription,
                            ),
                            TextSpan(
                              text: AppLocalizations.of(
                                context,
                              )!.theDoctorsAssociation,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      CheckmarkRow(
                        title: Text(
                          AppLocalizations.of(context)!.officialPdfFormat,
                        ),
                      ),
                      CheckmarkRow(
                        title: Text(
                          AppLocalizations.of(context)!.processingTime,
                        ),
                      ),
                      CheckmarkRow(
                        title: Text(
                          AppLocalizations.of(context)!.deliveredToEmail,
                        ),
                      ),
                    ],
                  ),
                ),

                CustomContainer(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.yourInformation,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),

                      CheckmarkRow(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.doctorName,
                                style: TextStyle(fontSize: 12),
                              ),
                              TextSpan(
                                text: userName,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CheckmarkRow(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(
                                  context,
                                )!.membershipIdLabel,
                                style: TextStyle(fontSize: 12),
                              ),
                              TextSpan(
                                text: '123456',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CheckmarkRow(
                        title: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!.status,
                                style: TextStyle(fontSize: 12),
                              ),
                              TextSpan(
                                text: AppLocalizations.of(
                                  context,
                                )!.activeMember,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "\$10",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),

                Divider(height: 0),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.byProceeding,
                      style: TextStyle(fontSize: 12),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: GradientText(
                        AppLocalizations.of(context)!.termsAndRefundPolicy,
                        gradient: AppColors.mainGradient,
                        style: TextStyle(
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                AppButton(
                  onPressed: () {},
                  gradient: AppColors.mainGradient,
                  width: 300,
                  child: Text(
                    AppLocalizations.of(context)!.continueToPayment,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
