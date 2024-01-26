import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/app/app.locator.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/core/theme/theme.dart';
import 'package:jora_test/core/utils/app.route.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      initialRoute: Routes.SPLASH.name,
      getPages: AppRoute.routes,
    );
  }
}
