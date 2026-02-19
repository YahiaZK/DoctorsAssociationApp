import 'package:flutter/material.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          l10n.faq,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildFaqItem(question: l10n.faqQuestion1, answer: l10n.faqAnswer1),
          _buildFaqItem(question: l10n.faqQuestion2, answer: l10n.faqAnswer2),
          _buildFaqItem(question: l10n.faqQuestion3, answer: l10n.faqAnswer3),
          _buildFaqItem(question: l10n.faqQuestion4, answer: l10n.faqAnswer4),
          _buildFaqItem(question: l10n.faqQuestion5, answer: l10n.faqAnswer5),
          _buildFaqItem(question: l10n.faqQuestion6, answer: l10n.faqAnswer6),
          _buildFaqItem(question: l10n.faqQuestion7, answer: l10n.faqAnswer7),
          _buildFaqItem(question: l10n.faqQuestion8, answer: l10n.faqAnswer8),
          _buildFaqItem(question: l10n.faqQuestion9, answer: l10n.faqAnswer9),
          _buildFaqItem(question: l10n.faqQuestion10, answer: l10n.faqAnswer10),
        ],
      ),
    );
  }

  Widget _buildFaqItem({required String question, required String answer}) {
    return Card(
      color: Colors.white,
      elevation: 0,
      margin: EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Text(
          question,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Text(
              answer,
              style: TextStyle(color: Colors.grey[700], height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
