import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/controllers/shell_controller.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/widgets/scroll_bar.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/widgets/side_nav_bar.dart';

class Shell extends StatefulWidget {
  const Shell({super.key});

  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShellController>();

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              const Flexible(child: SideNavBar()),
              const ScrollBar(),
              Expanded(
                flex: 4,
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    final metrics = notification.metrics;
                    if (metrics.axis == Axis.vertical) {
                      controller.currentScroll.value = metrics.pixels;
                      controller.maxScroll.value = metrics.maxScrollExtent;
                      controller.viewportDimension.value =
                          metrics.viewportDimension;
                    }
                    return false;
                  },
                  child: Obx(() => controller.getPage),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
