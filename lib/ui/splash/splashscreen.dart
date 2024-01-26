import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';
import 'package:jora_test/ui/splash/splash_controller.dart';
import 'package:jora_test/widget/app_textbutton.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      body: GetBuilder<SplashController>(builder: (_) {
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment(0.62, 0.4),
              colors: [
                Color(0xFFD12B2F),
                Color(0xFF3772FF),
              ],
            ),
          ),
          child: Center(
            child: SizedBox(
              width: 100.ffem(context),
              height: 40,
              child: AppButton(
                isActive: true,
                onPressed: _.getStarted,
                value: 'Get Started',
                valueColor: AppColor.primary,
                color: AppColor.scaffoldBackground,
                padding: const EdgeInsets.all(4),
              ),
            ),
          ),
        );
      }),
    );
  }
}
