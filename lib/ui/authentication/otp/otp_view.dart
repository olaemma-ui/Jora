import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';
import 'package:jora_test/ui/authentication/otp/otp_controller.dart';
import 'package:jora_test/widget/app_textbutton.dart';
import 'package:jora_test/widget/app_textfield.dart';
import 'package:jora_test/widget/loading_widget.dart';
import 'package:pinput/pinput.dart';

class OTPView extends GetWidget<OTPController> {
  const OTPView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(Get.context!).textTheme;

    pinPut() {
      final defaultPinTheme = PinTheme(
        width: 60.fem(context),
        height: 60.fem(context),
        textStyle: textTheme.labelSmall!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.border),
          borderRadius: BorderRadius.circular(8),
        ),
      );

      final focusedPinTheme = defaultPinTheme.copyDecorationWith(
        border: Border.all(color: AppColor.primary),
        borderRadius: BorderRadius.circular(8),
      );

      final submittedPinTheme = defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          color: const Color.fromRGBO(234, 239, 243, 1),
        ),
      );

      return Pinput(
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        length: 5,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
        onChanged: (v) {
          controller.setOtp(v);
        },
      );
    }

    return GetBuilder<OTPController>(
      init: OTPController(),
      builder: (controller) {
        return PopScope(
          canPop: !controller.isLoading,
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Enter OTP',
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
                        'Enter the authentication code has been sent to  '
                        '${controller.email.split('@').first.substring(0, 2)}***'
                        '@'
                        '${controller.email.split('@').last}',
                        style: textTheme.labelSmall!.copyWith(
                          fontSize: 4.ffem(context),
                          color: AppColor.dark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 55,
                        child: pinPut(),
                      ),
                      SizedBox(height: 9.ffem(context)),
                      SizedBox(
                        height: 40,
                        child: AppButton(
                          isActive: true,
                          onPressed: controller.verify,
                          value: 'Verify',
                          padding: const EdgeInsets.all(0),
                        ),
                      ),
                      // const SizedBox(height: 12),
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Text(
                              'Didn’t get the code?',
                              style: textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              controller.pressed
                                  ? controller.counter ?? ''
                                  : 'Resend',
                              style: textTheme.labelSmall!.copyWith(
                                color: AppColor.active,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ).onTap(
                                !controller.pressed ? null : controller.resend),
                          ],
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
                              style: textTheme.labelSmall!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ).onTap(controller.login),
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
