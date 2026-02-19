import 'package:flutter/material.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';

enum ServiceCategory { all, documents, learning, support }

extension ServiceCategoryExtension on ServiceCategory {
  String getLocalizedLabel(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (this) {
      case ServiceCategory.all:
        return l10n.all;
      case ServiceCategory.documents:
        return l10n.documentsCategory;
      case ServiceCategory.learning:
        return l10n.learningCategory;
      case ServiceCategory.support:
        return l10n.supportCategory;
    }
  }
}

class ServiceModel {
  final String iconPath;
  final String titleKey;
  final String route;
  final ServiceCategory category;

  const ServiceModel({
    required this.iconPath,
    required this.titleKey,
    required this.route,
    required this.category,
  });

  String getLocalizedTitle(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    switch (titleKey) {
      case 'continuousLearning':
        return l10n.continuousLearning;
      case 'doctorsBadge':
        return l10n.doctorsBadge;
      case 'doctorsCard':
        return l10n.doctorsCard;
      case 'membershipCertificate':
        return l10n.membershipCertificate;
      case 'searchJob':
        return l10n.searchJob;
      case 'complaints':
        return l10n.complaints;
      default:
        return titleKey;
    }
  }
}
