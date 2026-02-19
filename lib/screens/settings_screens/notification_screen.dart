import 'package:flutter/material.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          AppLocalizations.of(context)!.notifications,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.notifications_none_outlined,
                size: 300,
                color: const Color.fromRGBO(0, 0, 0, 0.2),
              ),

              Text(
                AppLocalizations.of(context)!.allCaughtUp,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
              ),
              Text(AppLocalizations.of(context)!.stayTuned),
            ],
          ),
        ),
      ),
    );
  }
}
