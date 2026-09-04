import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/sites/minimalisto/core/theme/theme.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/controllers/shell_controller.dart';

class MenuItem extends StatelessWidget {
  final BoxConstraints constraints;
  final String iconName;
  final String text;
  final int pos;

  const MenuItem({
    super.key,
    required this.constraints,
    required this.iconName,
    required this.text,
    required this.pos,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final controller = Get.find<ShellController>();
      bool isSelected = controller.selectedIndex.value == pos;
      bool isHovered = controller.hoveredIndex.value == pos;

      return GestureDetector(
        onTap: () {
          controller.setPageIndex(pos);
        },
        child: MouseRegion(
          onHover: (event) {
            controller.hoveredIndex.value = pos;
          },
          onExit: (event) {
            controller.hoveredIndex.value = -1;
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? context.colors.info
                  : isHovered
                  ? context.colors.neutral.shade700
                  : context.colors.background,
              borderRadius: .circular(isSelected ? 8 : 4),
              boxShadow: [
                BoxShadow(
                  offset: Offset(isSelected ? -5 : 0, 0),
                  color: isSelected
                      ? context.colors.primary
                      : Colors.transparent,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: .center,
              mainAxisSize: .min,
              spacing: 8,
              children: [
                SvgPicture.asset(
                  "assets/icons/minimalisto/$iconName.svg",
                  height: 32,
                  width: 32,
                  colorFilter: ColorFilter.mode(
                    isSelected
                        ? context.colors.background
                        : context.colors.textPrimary,
                    .srcIn,
                  ),
                ),
                if (constraints.maxWidth > 150)
                  FittedBox(
                    fit: .scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        text,
                        style: context.texts.tlgm.copyWith(
                          color: isSelected
                              ? context.colors.background
                              : context.colors.textPrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
