import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:doctors_association_app/components/custom_app_bar.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/providers/locale_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final currentLocale = ref.watch(localeProvider);

    // Determine the current language code
    final currentLanguageCode =
        currentLocale?.languageCode ??
        Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,
      appBar: CustomAppBar(
        title: Text(
          l10n.language,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            l10n.selectLanguage,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          SizedBox(height: 12),
          _buildLanguageOption(
            context: context,
            ref: ref,
            title: l10n.english,
            subtitle: 'English',
            languageCode: 'en',
            isSelected: currentLanguageCode == 'en',
          ),
          SizedBox(height: 8),
          _buildLanguageOption(
            context: context,
            ref: ref,
            title: l10n.arabic,
            subtitle: 'العربية',
            languageCode: 'ar',
            isSelected: currentLanguageCode == 'ar',
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption({
    required BuildContext context,
    required WidgetRef ref,
    required String title,
    required String subtitle,
    required String languageCode,
    required bool isSelected,
  }) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? BorderSide(color: AppColors.dentalTealDark, width: 2)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: () {
          ref.read(localeProvider.notifier).setLocale(Locale(languageCode));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.dentalTealDark.withAlpha(20)
                      : Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    languageCode == 'en' ? '🇬🇧' : '🇸🇦',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: isSelected
                            ? AppColors.dentalTealDark
                            : Colors.black87,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check_circle,
                  color: AppColors.dentalTealDark,
                  size: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
