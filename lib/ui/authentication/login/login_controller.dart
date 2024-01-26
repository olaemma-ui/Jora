import 'dart:developer';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/app/app.locator.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/core/extension/extension.dart';
import 'package:jora_test/core/utils/app.route.dart';
import 'package:jora_test/exception/exception.dart';
import 'package:jora_test/model/request/login_request.dart';
import 'package:jora_test/model/response/register_response.dart';
import 'package:jora_test/repository/auth_repo/auth_repo.dart';

class LoginController extends GetxController {
  final _authRepo = locator<AuthenticationRepo>();

  BuildContext context;

  LoginController(this.context);

  LoginRequest request = LoginRequest();

  String? emailError;
  String? pswError;
  bool? valid;

  /// Navigates to the Login page
  register() => Get.back();

  bool isLoading = false;

  _setLoading(bool v) {
    isLoading = v;
    update();
  }

  setEmail(String? value) {
    emailError = (value ?? '').validate(key: 'email', isRequired: true);
    if (emailError == null) {
      valid = true;
      request = request.copyWith(email: value);
    }
    update();
  }

  setPassword(String? value) {
    pswError = (value ?? '').validate(key: 'password', isRequired: true);
    if (pswError == null) {
      valid = true;
      request = request.copyWith(password: value);
    }
    update();
  }

  Future<void> login() async {
    if ((valid ?? false)) {
      _setLoading(true);
      final response = await _authRepo.login(body: request);

      // log('response = $response');
      response.fold((l) {
        Get.snackbar(
          'Error',
          l.prettyMessage,
          icon: const Icon(Icons.error_outline),
          isDismissible: true,
          backgroundColor: AppColor.danger,
          padding: const EdgeInsets.all(8),
          shouldIconPulse: true,
          duration: const Duration(seconds: 2),
        );

        if (l is AccountNotVerifiedException) {
          log('l = ${l.data}');
          AppRoute.navigateTo(
              route: Routes.OTP,
              argument: TokenResponse.fromMap((l.data as Map<String, dynamic>)),
              parameters: {
                'email': request.email ?? '',
                'route': Routes.SUCCESS.name,
              });
        }
      }, (r) {
        AppRoute.navigateTo(route: Routes.SUCCESS, argument: {
          'message': 'Welcome ',
          'btn_text': 'Back to Login',
        });
        // Get.snackbar(
        //   'Success',
        //   r.data?.message ?? 'Login Successful',
        //   icon: const Icon(Icons.check_circle_outline_outlined),
        //   isDismissible: true,
        //   backgroundColor: AppColor.success,
        //   padding: const EdgeInsets.all(8),
        //   shouldIconPulse: true,
        //   duration: const Duration(seconds: 2),
        // );
      });

      _setLoading(false);
    }
  }

  /// Navigates to the Login page
  forgotPassword() => AppRoute.navigateTo(route: Routes.FORGOT_PASSWORD);
}
