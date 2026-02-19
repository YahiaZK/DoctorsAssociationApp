import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? flexibleSpaceContent;
  const CustomAppBar({
    super.key,
    required this.title,
    this.flexibleSpaceContent,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      flexibleSpace: Container(
        decoration: BoxDecoration(gradient: AppColors.mainGradient),
        child: flexibleSpaceContent != null
            ? SafeArea(child: flexibleSpaceContent!)
            : null,
      ),
      leading: IconButton(
        onPressed: () {
          if (context.canPop()) {
            context.pop();
          } else {
            // Fallback: If there is no history (e.g. user opened app directly on this page),
            // go to the previous logical screen manually.
            context.go('/');
          }
        },
        icon: Directionality.of(context) == TextDirection.rtl
            ? Transform.flip(
                flipX: true,
                child: SvgPicture.asset('assets/icons/arrow_back.svg'),
              )
            : SvgPicture.asset('assets/icons/arrow_back.svg'),
      ),
      centerTitle: true,
    );
  }
}
