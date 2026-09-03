import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:portfolio_v2/firebase_options.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/controllers/shell_controller.dart';

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();

  Get.put(ShellController());
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
