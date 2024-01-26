import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';
import 'package:jora_test/ui/authentication/reset_password/reset_password_controller.dart';
import 'package:jora_test/widget/app_textbutton.dart';
import 'package:jora_test/widget/app_textfield.dart';

class ResetPasswordView extends GetWidget<ResetPasswordController> {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<ResetPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Reset Password',
              style: textTheme.labelMedium!.copyWith(
                fontSize: 4.5.ffem(context),
                color: AppColor.dark,
                fontWeight: FontWeight.w600,
              ),
            ),
            leadingWidth: 40,
            leading: const Icon(
              Icons.keyboard_backspace,
              size: 15,
            ).onTap(Get.back),
            centerTitle: true,
          ),
          backgroundColor: AppColor.scaffoldBackground,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(12).copyWith(top: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Please reset your password below',
                  style: textTheme.labelSmall!.copyWith(
                    fontSize: 4.ffem(context),
                    color: AppColor.dark,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 55,
                  child: AppTextField(
                    controller: TextEditingController(),
                    isPassword: true,
                    isTextArea: false,
                    label: 'Password',
                    placeholder: 'Enter',
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 55,
                  child: AppTextField(
                    controller: TextEditingController(),
                    isPassword: true,
                    isTextArea: false,
                    label: 'Confirm Password',
                    placeholder: 'Enter',
                  ),
                ),
                SizedBox(height: 8.ffem(context)),
                SizedBox(
                  height: 40,
                  child: AppButton(
                    isActive: true,
                    onPressed: controller.success,
                    value: 'Submit',
                    padding: const EdgeInsets.all(0),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    runAlignment: WrapAlignment.center,
                    children: [
                      const Icon(
                        Icons.keyboard_backspace,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Back to Sign In',
                        style: textTheme.labelSmall,
                      ),
                    ],
                  ).onTap(controller.login),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
