import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:doctors_association_app/l10n/app_localizations.dart';
import 'package:doctors_association_app/theme/app_colors.dart';

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  Widget _buildIcon(String assetPath, bool isSelected) {
    final icon = SvgPicture.asset(
      assetPath,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.white : Colors.black,
        BlendMode.srcIn,
      ),
    );

    if (isSelected) {
      return ShaderMask(
        shaderCallback: (Rect bounds) {
          return AppColors.mainGradient.createShader(bounds);
        },
        blendMode: BlendMode.srcIn,
        child: icon,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: navigationShell.currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          // Navigate to home tab instead of exiting
          navigationShell.goBranch(0, initialLocation: true);
        }
      },
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.buttonBackgroundColor,
          currentIndex: navigationShell.currentIndex,
          onTap: (index) => _onTap(context, index),
          selectedItemColor: AppColors.dentalTealDark,
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/bottom_navigation_bar/home.svg',
                navigationShell.currentIndex == 0,
              ),
              label: AppLocalizations.of(context)!.home,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/bottom_navigation_bar/services.svg',
                navigationShell.currentIndex == 1,
              ),
              label: AppLocalizations.of(context)!.services,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/bottom_navigation_bar/news.svg',
                navigationShell.currentIndex == 2,
              ),
              label: AppLocalizations.of(context)!.news,
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(
                'assets/icons/bottom_navigation_bar/profile.svg',
                navigationShell.currentIndex == 3,
              ),
              label: AppLocalizations.of(context)!.profile,
            ),
          ],
        ),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      // Navigate to the initial location when tapping the item that is already active
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
