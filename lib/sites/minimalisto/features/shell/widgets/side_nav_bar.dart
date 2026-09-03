import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/core/constants/portfolio_data.dart';
import 'package:portfolio_v2/core/theme/theme.dart';
import 'package:portfolio_v2/core/widgets/custom_image_viewer.dart';
import 'package:zo_animated_border/widget/zo_text_border.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZoTextBorder(
          text: user.name,
          borderRadius: BorderRadius.circular(999),
          textStyle: TextStyle(
            color: context.colors.textPrimary,
            letterSpacing: 5,
          ),
          child: CustomImageViewer(
            "https://picsum.photos/550/550",
            size: 200,
            radius: 200,
          ),
        ),
        Spacer(),
        Row(
          crossAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            Text("Home", style: context.texts.tlgm),
          ],
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            final isDark = Get.isDarkMode;
            Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
            Get.changeTheme(isDark ? AppTheme.lightTheme : AppTheme.darkTheme);
          },
          child: const FlutterLogo(),
        ),
      ],
    );
  }
}
