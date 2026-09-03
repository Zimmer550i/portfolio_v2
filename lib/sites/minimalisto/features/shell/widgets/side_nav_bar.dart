import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/core/constants/portfolio_data.dart';
import 'package:portfolio_v2/core/theme/theme.dart';
import 'package:portfolio_v2/core/widgets/custom_image_viewer.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/controllers/shell_controller.dart';
import 'package:zo_animated_border/widget/zo_text_border.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
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
                  menuItem(context, constraints, "home", "Home", 0),
                  menuItem(context, constraints, "work", "Contact", 1),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  // AppColors.setPalette(AppPalettes.oceanBlue);
                  print(AppColors.currentPalette.name);
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

  Row menuItem(
    BuildContext context,
    BoxConstraints constraints,
    String iconName,
    String text,
    int pos,
  ) {
    final controller = Get.find<ShellController>();
    bool isSelected = controller.index.value == pos;

    return Row(
      crossAxisAlignment: .end,
      mainAxisSize: .min,
      spacing: 8,
      children: [
        SvgPicture.asset(
          "icons/minimalisto/$iconName.svg",
          height: 32,
          width: 32,
          color: context.colors.textPrimary,
        ),
        if (constraints.maxWidth > 150)
          FittedBox(
            fit: .scaleDown,
            child: Text(text, style: context.texts.tlgm),
          ),
      ],
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
