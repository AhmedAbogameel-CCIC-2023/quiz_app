import 'package:flutter/material.dart';
import 'package:quiz_app_g1/core/app_colors/app_colors.dart';

import 'app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key, this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.gray,
      ),
      title: AppText(
        title: title ?? "",
        fontWeight: FontWeight.w900,
        fontSize: 16,
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
