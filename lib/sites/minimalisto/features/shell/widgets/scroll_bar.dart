import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/sites/minimalisto/core/theme/theme.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/controllers/shell_controller.dart';

class ScrollBar extends StatelessWidget {
  const ScrollBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShellController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final trackHeight = constraints.maxHeight;

        return Obx(() {
          final max = controller.maxScroll.value;
          final current = controller.currentScroll.value;
          final viewport = controller.viewportDimension.value > 0
              ? controller.viewportDimension.value
              : trackHeight;

          if (max <= 0 || trackHeight <= 0) {
            return SizedBox(
              width: 3,
              child: Container(
                height: double.infinity,
                width: 3,
                color: context.colors.primary.shade300.withValues(alpha: 0.3),
              ),
            );
          }

          final totalContentHeight = viewport + max;

          const minThumbHeight = 40.0;
          final calculatedThumbHeight =
              (viewport / totalContentHeight) * trackHeight;
          final thumbHeight = calculatedThumbHeight.clamp(
            minThumbHeight,
            trackHeight,
          );

          final availableTravelDistance = trackHeight - thumbHeight;

          final scrollProgress = (current / max).clamp(0.0, 1.0);

          final thumbTop = scrollProgress * availableTravelDistance;

          return SizedBox(
            width: 3,
            child: ClipRRect(
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  // Track background
                  Container(
                    height: double.infinity,
                    width: 3,
                    color: context.colors.primary.shade300.withValues(alpha: 0.1),
                  ),
                  // Animated Thumb
                  Positioned(
                    top: thumbTop,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeOut,
                      height: thumbHeight,
                      width: 3,
                      decoration: BoxDecoration(
                        // color: context.colors.primary,
                        borderRadius: BorderRadius.circular(2.5),
                        boxShadow: [
                          BoxShadow(
                            color: context.colors.primary,
                            blurRadius: 50,
                            spreadRadius: 50,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
