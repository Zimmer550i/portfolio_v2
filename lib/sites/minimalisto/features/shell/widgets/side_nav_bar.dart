import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/core/constants/portfolio_data.dart';
import 'package:portfolio_v2/sites/minimalisto/core/theme/theme.dart';
import 'package:portfolio_v2/core/widgets/custom_image_viewer.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/widgets/menu_item.dart';
import 'package:zo_animated_border/widget/zo_text_border.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // print(constraints.maxWidth);
        return Padding(
          padding: EdgeInsets.all(constraints.maxWidth < 200 ? 24 : 48),
          child: Column(
            children: [
              showImage(constraints, context),
              Spacer(),
              Column(
                crossAxisAlignment: .start,
                spacing: 12,
                children: [
                  MenuItem(
                    constraints: constraints,
                    iconName: "home",
                    text: "Home",
                    pos: 0,
                  ),
                  MenuItem(
                    constraints: constraints,
                    iconName: "contact",
                    text: "Contact",
                    pos: 1,
                  ),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  AppColors.setPalette(AppPalettes.oceanBlue);
                  if (kDebugMode) {
                    print(AppColors.currentPalette.name);
                  }
                  final isDark = Get.isDarkMode;
                  Get.changeThemeMode(
                    isDark ? ThemeMode.light : ThemeMode.dark,
                  );
                  Get.changeTheme(
                    isDark ? AppTheme.lightTheme : AppTheme.darkTheme,
                  );
                },
                child: const FlutterLogo(),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget showImage(BoxConstraints constraints, BuildContext context) {
    final widget = CustomImageViewer(
      "https://picsum.photos/550/550",
      radius: 9999,
    );

    if (constraints.maxWidth > 200) {
      return ZoTextBorder(
        text: user.name,
        borderRadius: BorderRadius.circular(999),
        textStyle: TextStyle(
          color: context.colors.textPrimary,
          letterSpacing: 5,
        ),
        child: widget,
      );
    } else {
      return widget;
    }
  }
}
