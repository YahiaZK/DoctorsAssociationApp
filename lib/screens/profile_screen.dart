import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/providers/auth_provider.dart';
import 'package:doctors_association_app/providers/user_provider.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool mode = false;

  @override
  Widget build(BuildContext context) {
    final userAsync = ref.watch(currentUserProvider);

    return Scaffold(
      backgroundColor: AppColors.screenBackgroundColor,

      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        surfaceTintColor: AppColors.dentalTealLight,
        actionsPadding: EdgeInsets.only(right: 18),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            child: Column(
              spacing: 21,
              children: [
                IntrinsicWidth(
                  child: Stack(
                    children: [
                      SvgPicture.asset('assets/icons/profileCard.svg'),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 6),
                        child: Row(
                          textDirection: TextDirection.ltr,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/profileBadge.svg',
                              width: 20,
                              height: 20,
                            ),
                            Text(
                              'Association Member',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/profile-picture1.jpg',
                                  ),
                                  radius: 34,
                                ),
                                Text(
                                  userAsync.when(
                                    data: (user) => user != null
                                        ? '${user.firstName} ${user.lastName}'
                                        : AppLocalizations.of(context)!.guest,
                                    loading: () => '...',
                                    error: (_, _) =>
                                        AppLocalizations.of(context)!.error,
                                  ),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'No.NaNaN',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                _buildSection(
                  title: AppLocalizations.of(context)!.account,
                  items: [
                    ListTile(
                      leading: Icon(Icons.person_outline),
                      title: Text(AppLocalizations.of(context)!.accountDetails),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/account-details'),
                    ),
                    ListTile(
                      leading: Icon(Icons.description_outlined),
                      title: Text(AppLocalizations.of(context)!.documents),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/documents'),
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_open_outlined),
                      title: Text(AppLocalizations.of(context)!.changePassword),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/change-password'),
                    ),
                  ],
                ),
                _buildSection(
                  title: AppLocalizations.of(context)!.general,
                  items: [
                    ListTile(
                      leading: Icon(Icons.notifications_outlined),
                      title: Text(AppLocalizations.of(context)!.notification),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/notifications'),
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text(AppLocalizations.of(context)!.language),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/language'),
                    ),
                    ListTile(
                      leading: Icon(Icons.dark_mode_outlined),
                      title: Text(AppLocalizations.of(context)!.darkMode),
                      trailing: Switch(
                        value: mode,
                        onChanged: (bool val) {
                          setState(() {
                            mode = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                _buildSection(
                  title: AppLocalizations.of(context)!.helpAndSupport,
                  items: [
                    ListTile(
                      leading: Icon(Icons.help_outline),
                      title: Text(AppLocalizations.of(context)!.faq),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/faq'),
                    ),
                    ListTile(
                      leading: Icon(Icons.send_outlined),
                      title: Text(AppLocalizations.of(context)!.giveUsFeedback),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/feedback'),
                    ),
                  ],
                ),
                _buildSection(
                  title: AppLocalizations.of(context)!.legal,
                  items: [
                    ListTile(
                      leading: Icon(Icons.article_outlined),
                      title: Text(
                        AppLocalizations.of(context)!.termsAndConditions,
                      ),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/terms-conditions'),
                    ),
                    ListTile(
                      leading: Icon(Icons.privacy_tip_outlined),
                      title: Text(AppLocalizations.of(context)!.privacyPolicy),
                      trailing: Icon(Icons.chevron_right),
                      onTap: () => context.go('/profile/privacy-policy'),
                    ),
                  ],
                ),
                // Card(
                //   color: Colors.white,
                //   margin: EdgeInsets.zero,
                //   elevation: 0,
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(16),
                //   ),
                //   child: ListTile(
                //     leading: Icon(Icons.delete_outline),
                //     title: Text("Delete the account"),
                //   ),
                // ),
                Card(
                  color: Colors.white,
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    onTap: () => _showLogoutConfirmation(context),
                    title: Text(
                      AppLocalizations.of(context)!.logOut,
                      style: TextStyle(color: Colors.red),
                    ),
                    trailing: Icon(Icons.logout, color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.logOutTitle),
        content: Text(AppLocalizations.of(context)!.areYouSureLogout),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(AppLocalizations.of(context)!.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              ref.read(authControllerProvider.notifier).logout();
            },
            child: Text(
              AppLocalizations.of(context)!.logOut,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildSection({required String title, required List<Widget> items}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 16, bottom: 8),
        child: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(children: items),
      ),
    ],
  );
}
