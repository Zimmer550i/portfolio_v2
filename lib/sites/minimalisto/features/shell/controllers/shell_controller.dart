import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/sites/minimalisto/features/contact/views/contact.dart';
import 'package:portfolio_v2/sites/minimalisto/features/home/views/home.dart';

class ShellController extends GetxController {
  final List<Widget> _pages = const [Home(), Contact(), FlutterLogo(size: 800)];

  final RxInt selectedIndex = RxInt(0);
  final RxInt hoveredIndex = RxInt(0);

  final RxDouble maxScroll = RxDouble(0);
  final RxDouble currentScroll = RxDouble(0);
  final RxDouble viewportDimension = RxDouble(0);

  void resetScroll() {
    currentScroll.value = 0;
    maxScroll.value = 0;
  }

  void setPageIndex(int index) {
    if (selectedIndex.value != index) {
      selectedIndex.value = index;
      resetScroll();
    }
  }

  Widget get getPage => _pages[selectedIndex.value % _pages.length];
}
