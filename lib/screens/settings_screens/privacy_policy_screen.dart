import 'package:flutter/material.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          l10n.privacyPolicy,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Card(
            color: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.doctorsAssociation,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    l10n.privacyPolicySubtitle,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    l10n.effectiveDate,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          _buildSection(
            title: l10n.ppIntroductionTitle,
            content: l10n.ppIntroductionContent,
          ),
          _buildSection(
            title: l10n.ppInfoCollectTitle,
            content: l10n.ppInfoCollectContent,
          ),
          _buildSection(
            title: l10n.ppHowWeUseTitle,
            content: l10n.ppHowWeUseContent,
          ),
          _buildSection(
            title: l10n.ppInfoSharingTitle,
            content: l10n.ppInfoSharingContent,
          ),
          _buildSection(
            title: l10n.ppDataSecurityTitle,
            content: l10n.ppDataSecurityContent,
          ),
          _buildSection(
            title: l10n.ppDataRetentionTitle,
            content: l10n.ppDataRetentionContent,
          ),
          _buildSection(
            title: l10n.ppYourRightsTitle,
            content: l10n.ppYourRightsContent,
          ),
          _buildSection(
            title: l10n.ppCookiesTitle,
            content: l10n.ppCookiesContent,
          ),
          _buildSection(
            title: l10n.ppChildrenTitle,
            content: l10n.ppChildrenContent,
          ),
          _buildSection(
            title: l10n.ppChangesTitle,
            content: l10n.ppChangesContent,
          ),
          _buildSection(
            title: l10n.ppContactTitle,
            content: l10n.ppContactContent,
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(color: Colors.grey[700], height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
