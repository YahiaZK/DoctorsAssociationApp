import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:doctors_association_app/components/app_button.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/models/course_model.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class CourseDetailsScreen extends StatelessWidget {
  final CourseModel course;
  const CourseDetailsScreen({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          AppLocalizations.of(context)!.courseDetails,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (course.imageUrl.isNotEmpty)
                        Image.network(
                          course.imageUrl,
                          height: 170,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16,
                          children: [
                            Text(
                              course.getTitle(languageCode),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            course.isOnline
                                ? Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/zoom_logo.svg',
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.onlineViaZoom,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: AppColors.iconGreyColor,
                                      ),
                                      SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          course.getLocation(languageCode),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: Colors.grey[800],
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.calendar_month,
                                      size: 16,
                                      color: AppColors.iconGreyColor,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      DateFormat(
                                        'MMMM dd, yyyy',
                                      ).format(course.date),
                                      maxLines: 1,
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
                                      Icons.watch_later_outlined,
                                      size: 16,
                                      color: AppColors.iconGreyColor,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      DateFormat('hh:mm a').format(course.date),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.grey[800],
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 1),
                              ],
                            ),

                            SizedBox(height: 20),
                            Text(
                              AppLocalizations.of(context)!.aboutTheCourse,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              course.getDescription(languageCode),
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ],
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
                "${AppLocalizations.of(context)!.registerFor} \$${course.price}",
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
