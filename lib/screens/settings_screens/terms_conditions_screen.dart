import 'package:flutter/material.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          l10n.termsAndConditions,
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
                    l10n.termsConditionsSubtitle,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Text(
                    l10n.lastUpdated,
                    style: TextStyle(color: Colors.grey[500], fontSize: 12),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 12),
          _buildSection(
            title: l10n.tcAcceptanceTitle,
            content: l10n.tcAcceptanceContent,
          ),
          _buildSection(
            title: l10n.tcEligibilityTitle,
            content: l10n.tcEligibilityContent,
          ),
          _buildSection(
            title: l10n.tcAccountTitle,
            content: l10n.tcAccountContent,
          ),
          _buildSection(
            title: l10n.tcConductTitle,
            content: l10n.tcConductContent,
          ),
          _buildSection(
            title: l10n.tcEducationTitle,
            content: l10n.tcEducationContent,
          ),
          _buildSection(title: l10n.tcFeesTitle, content: l10n.tcFeesContent),
          _buildSection(title: l10n.tcIpTitle, content: l10n.tcIpContent),
          _buildSection(
            title: l10n.tcLiabilityTitle,
            content: l10n.tcLiabilityContent,
          ),
          _buildSection(
            title: l10n.tcTerminationTitle,
            content: l10n.tcTerminationContent,
          ),
          _buildSection(
            title: l10n.tcContactTitle,
            content: l10n.tcContactContent,
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
