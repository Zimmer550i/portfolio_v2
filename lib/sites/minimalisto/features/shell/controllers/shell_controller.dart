import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ShellController extends GetxController {
  final List<Widget> _pages = const [
    FlutterLogo(size: 200),
    FlutterLogo(size: 500),
    FlutterLogo(size: 800),
  ];
  


  final RxInt index = RxInt(0);

  Widget get getPage => _pages[index.value % _pages.length];
}
