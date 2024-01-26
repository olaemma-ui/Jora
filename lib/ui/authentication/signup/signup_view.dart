import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/extension/dimension.extension.dart';
import 'package:jora_test/ui/authentication/signup/signup_controller.dart';
import 'package:jora_test/widget/app_textbutton.dart';
import 'package:jora_test/widget/app_textfield.dart';
import 'package:jora_test/widget/loading_widget.dart';
import 'package:jora_test/widget/password_pattern.widget.dart';

class SignupView extends GetWidget<SignupController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetBuilder<SignupController>(
      builder: (controller) {
        return PopScope(
          canPop: !controller.isLoading,
          child: Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Get Started',
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
                body: DefaultTabController(
                  length: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          tabs: [
                            Text(
                              'Customer',
                              style: TextStyle(
                                fontSize: 4.ffem(context),
                              ),
                            ),
                            Text(
                              'Seller',
                              style: TextStyle(
                                fontSize: 4.ffem(context),
                              ),
                            ),
                            // const SizedBox()
                          ],
                          dividerHeight: 2,
                          indicatorColor: AppColor.primary,
                          labelColor: AppColor.dark,
                          labelPadding: const EdgeInsets.all(4),
                          unselectedLabelColor: AppColor.grey_2,
                          // tabAlignment: TabAlignment.start,
                          // isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelStyle: TextStyle(
                            fontSize: 4.2.ffem(context),
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'Create an account to get started',
                                  style: textTheme.labelSmall!.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.dark,
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  height: 75,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: AppTextField(
                                          isTextArea: false,
                                          label: 'First Name',
                                          placeholder: 'Enter',
                                          regex: '[a-zA-Z]',
                                          errorMessage:
                                              controller.firstNameError,
                                          onChange: (v) {
                                            controller.setFirstName(v ?? '');
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: AppTextField(
                                          isTextArea: false,
                                          label: 'Last Name',
                                          placeholder: 'Enter',
                                          regex: '[a-zA-Z]',
                                          errorMessage:
                                              controller.lastNameError,
                                          onChange: (v) {
                                            controller.setLastName(v ?? '');
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Phone Number',
                                  style: textTheme.labelSmall!.copyWith(
                                    fontSize: 12,
                                    color: AppColor.dark,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // Text('ola'),
                                    CountryCodePicker(
                                      onChanged: (v) {
                                        controller.code = v.dialCode;
                                        controller.update();
                                      },
                                      dialogTextStyle: textTheme.labelSmall,
                                      initialSelection: 'NG',
                                      showFlagDialog: true,
                                      flagWidth: 15,
                                      builder: (country) =>
                                          _CountryBuilder(country: country),
                                    ),
                                    Expanded(
                                      // flex: 2,
                                      child: AppTextField(
                                        isTextArea: false,
                                        placeholder:
                                            '(${controller.code ?? '+234'}) -',
                                        radius: const BorderRadius.only(
                                          topRight: Radius.circular(6),
                                          bottomRight: Radius.circular(6),
                                        ),
                                        regex: r'^[0-9]{0,10}',
                                        // errorMessage: controller.phoneError,
                                        onChange: (v) {
                                          controller.setPhoneNumber(v ?? '');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                if (controller.phoneError != null)
                                  Text(
                                    controller.phoneError!,
                                    style: TextStyle(
                                      color: AppColor.danger,
                                      fontFamily:
                                          textTheme.labelSmall!.fontFamily,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    overflow: TextOverflow.clip,
                                  ),
                                const SizedBox(height: 8),
                                AppTextField(
                                  isTextArea: false,
                                  label: 'Email',
                                  placeholder: 'Enter',
                                  regex:
                                      r'^(([\w-0-9^<>()[\]\\.,;:\s@\"]{1,}))$',
                                  errorMessage: controller.emailError,
                                  onChange: (v) {
                                    controller.setEmail(v ?? '');
                                  },
                                ),
                                const SizedBox(height: 12),
                                AppTextField(
                                  isPassword: true,
                                  isTextArea: false,
                                  label: 'Password',
                                  placeholder: 'Enter',
                                  regex: r'[A-Za-z0-9(!@#$%^&*)]',
                                  onChange: (v) {
                                    controller.setPassword(v ?? '');
                                  },
                                ),
                                const SizedBox(height: 8),
                                if (!(controller.pswError['length'] ??
                                    false)) ...[
                                  PasswordPattern(
                                    value:
                                        controller.pswError['length'] ?? false,
                                    text: 'Must be at least 8 characters long',
                                    style: textTheme.labelSmall!,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                if (!(controller.pswError['lower'] ??
                                    false)) ...[
                                  PasswordPattern(
                                    value:
                                        controller.pswError['lower'] ?? false,
                                    text: 'Include at least 1 lowercase letter',
                                    style: textTheme.labelSmall!,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                if (!(controller.pswError['upper'] ??
                                    false)) ...[
                                  PasswordPattern(
                                    value:
                                        controller.pswError['upper'] ?? false,
                                    text: 'Include at least 1 uppercase letter',
                                    style: textTheme.labelSmall!,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                if (!(controller.pswError['symbol'] ??
                                    false)) ...[
                                  PasswordPattern(
                                    value:
                                        controller.pswError['symbol'] ?? false,
                                    text:
                                        'Include at least 1 special character (!@#\$%^&*) ',
                                    style: textTheme.labelSmall!,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                if (!(controller.pswError['number'] ??
                                    false)) ...[
                                  PasswordPattern(
                                    value:
                                        controller.pswError['number'] ?? false,
                                    text: 'Include at least a number [0-9]',
                                    style: textTheme.labelSmall!,
                                  ),
                                  const SizedBox(height: 8),
                                ],
                                const SizedBox(height: 8),
                                AppTextField(
                                  isTextArea: false,
                                  isPassword: true,
                                  label: 'Confirm Password',
                                  placeholder: 'Enter',
                                  regex: r'[A-Za-z0-9(!@#$%^&*)]',
                                  errorMessage: controller.cpswError,
                                  onChange: controller.setConfirmPassword,
                                ),
                                SizedBox(height: 8.ffem(context)),
                                SizedBox(
                                  height: 50,
                                  child: AppButton(
                                    isActive: true,
                                    onPressed: controller.submit,
                                    value: 'Craete Account',
                                    padding: const EdgeInsets.all(0),
                                  ),
                                ),
                                // const SizedBox(height: 8),
                                Center(
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    runAlignment: WrapAlignment.center,
                                    children: [
                                      Text(
                                        'Have an sccount? ',
                                        style: textTheme.labelSmall,
                                      ),
                                      Text(
                                        'Sign In',
                                        style: textTheme.labelSmall!.copyWith(
                                          color: AppColor.active,
                                        ),
                                      ),
                                    ],
                                  ).onTap(controller.login),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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

class _CountryBuilder extends StatelessWidget {
  final CountryCode? country;
  const _CountryBuilder({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.2,
            color: AppColor.grey_2,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(7),
            bottomLeft: Radius.circular(7),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  // width: 6.ffem(context),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(
                    country?.flagUri ?? '',
                    package: 'country_code_picker',
                    width: 40,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
