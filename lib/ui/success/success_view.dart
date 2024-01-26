import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';
import 'package:jora_test/ui/success/success_controller.dart';
import 'package:jora_test/widget/app_textbutton.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessScreen extends GetView<SuccessController> {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackground,
      body: GetBuilder<SuccessController>(builder: (controller) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 320.fem(context),
                  height: 320.fem(context),
                  child: SvgPicture.asset(
                    'assets/image/success.svg',
                    semanticsLabel: 'Svg Image',
                  ),
                ),
                Text(
                  'Successful!',
                  style: textTheme.labelMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    Get.arguments['message'],
                    style: textTheme.labelSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 6.ffem(context),
                ),
                Center(
                  child: SizedBox(
                    width: 300,
                    height: 50,
                    child: AppButton(
                      isActive: true,
                      onPressed: Get.back,
                      value: Get.arguments['btn_text'],
                      valueColor: AppColor.scaffoldBackground,
                      padding: const EdgeInsets.all(4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
