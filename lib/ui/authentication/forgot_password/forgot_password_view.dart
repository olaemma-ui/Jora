import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';
import 'package:jora_test/ui/authentication/forgot_password/forgot_password_controller.dart';
import 'package:jora_test/widget/app_textbutton.dart';
import 'package:jora_test/widget/app_textfield.dart';

class ForgotPasswordView extends GetWidget<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<ForgotPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Forgot Password?',
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
                  'Don’t worry! It happens. Please enter the email '
                  'address associated with your account.',
                  style: textTheme.labelSmall!.copyWith(
                    fontSize: 4.ffem(context),
                    color: AppColor.dark,
                  ),
                ),
                const SizedBox(height: 12),
                AppTextField(
                  controller: TextEditingController(),
                  isTextArea: false,
                  label: 'Email',
                  placeholder: 'Enter',
                ),
                const SizedBox(height: 12),
                SizedBox(height: 8.ffem(context)),
                SizedBox(
                  height: 40,
                  child: AppButton(
                    isActive: true,
                    onPressed: controller.resetPassword,
                    value: 'Submit',
                    padding: const EdgeInsets.all(0),
                  ),
                ),
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
