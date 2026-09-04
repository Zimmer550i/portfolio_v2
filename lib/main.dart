import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:portfolio_v2/core/utils/di.dart';
import 'package:portfolio_v2/sites/minimalisto/features/shell/views/shell.dart';

import 'package:portfolio_v2/sites/minimalisto/core/theme/theme.dart';

void main() async {
  await init();
  runApp(
    GetMaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Shell(),
    ),
  );
}
