import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';
import 'package:jora_test/ui/authentication/login/login_controller.dart';
import 'package:jora_test/widget/app_textbutton.dart';
import 'package:jora_test/widget/app_textfield.dart';
import 'package:jora_test/widget/loading_widget.dart';

class LoginView extends GetWidget<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<LoginController>(
      init: LoginController(context),
      builder: (controller) {
        return PopScope(
          canPop: !controller.isLoading,
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Sign In',
                    style: textTheme.labelMedium!.copyWith(
                      fontSize: 4.5.ffem(context),
                      color: AppColor.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  leadingWidth: 40,
                  leading: const Icon(
                    Icons.keyboard_backspace,
                    size: 20,
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
                        'Welcome back!',
                        style: textTheme.labelSmall!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.dark,
                        ),
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        isTextArea: false,
                        label: 'Email',
                        placeholder: 'Enter',
                        regex: r'^(([\w-0-9^<>()[\]\\.,;:\s@\"]{1,}))$',
                        errorMessage: controller.emailError,
                        onChange: controller.setEmail,
                      ),
                      const SizedBox(height: 12),
                      AppTextField(
                        isPassword: true,
                        isTextArea: false,
                        label: 'Password',
                        placeholder: 'Enter',
                        regex: r'[A-Za-z0-9(!@#$%^&*)]',
                        errorMessage: controller.pswError,
                        onChange: controller.setPassword,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'Forgot Password?',
                          style: textTheme.labelSmall!.copyWith(
                            color: AppColor.noteColor,
                            fontSize: 12,
                          ),
                        ).onTap(controller.forgotPassword),
                      ),
                      SizedBox(height: 8.ffem(context)),
                      SizedBox(
                        height: 50,
                        child: AppButton(
                          isActive: true,
                          onPressed: controller.login,
                          value: 'Sign In',
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
                            Text(
                              'Dont\' have an sccount? ',
                              style: textTheme.labelSmall,
                            ),
                            Text(
                              'Sign Up',
                              style: textTheme.labelSmall!.copyWith(
                                color: AppColor.active,
                              ),
                            ).onTap(controller.register),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: controller.isLoading,
                child: const LoadingWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
