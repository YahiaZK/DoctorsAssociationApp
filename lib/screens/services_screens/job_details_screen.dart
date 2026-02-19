import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doctors_association_app/components/app_button.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/models/job_model.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class JobDetailsScreen extends StatelessWidget {
  final JobModel job;
  const JobDetailsScreen({super.key, required this.job});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          AppLocalizations.of(context)!.jobDetails,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 22),
              child: Center(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.white,
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Center(
                          child: Container(
                            width: 80,
                            height: 80,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.iconGreyColor,
                              ),
                            ),
                            child: Image.network(
                              job.imageUrl,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 75,
                                  width: 75,
                                  color: Colors.white,
                                  child: const Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: 50,
                                    ),
                                  ),
                                );
                              },
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Container(
                                      height: 75,
                                      width: 75,
                                      color: Colors.white,
                                      child: const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Text(
                            job.getPosition(languageCode),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          job.getRecruiter(languageCode),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: AppColors.iconGreyColor,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  job.getLocation(languageCode),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money_outlined,
                                  size: 16,
                                  color: AppColors.iconGreyColor,
                                ),
                                Text(
                                  '${job.salary}${AppLocalizations.of(context)!.perMonth}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: Colors.grey[800],
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              size: 16,
                              color: AppColors.iconGreyColor,
                            ),
                            SizedBox(width: 4),
                            Text(
                              DateFormat('MMMM dd, yyyy').format(job.date),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          AppLocalizations.of(context)!.jobDescription,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          job.getJobDescription(languageCode),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          AppLocalizations.of(context)!.jobRequirements,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          job.getJobRequirements(languageCode),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 24,
            right: 24,
            child: AppButton(
              gradient: AppColors.mainGradient,
              child: Text(
                AppLocalizations.of(context)!.applyNow,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
