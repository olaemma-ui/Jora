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
import 'package:jora_test/model/request/register_req.dart';
import 'package:jora_test/model/response/register_response.dart';
import 'package:jora_test/repository/auth_repo/auth_repo.dart';

class SignupController extends GetxController {
  final _authRepo = locator<AuthenticationRepo>();

  /// Navigates to the Login page
  login() => AppRoute.navigateTo(route: Routes.LOGIN);
  BuildContext? context;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    context = Get.context!;
  }

  bool isLoading = false;
  bool? valid;

  String? emailError;
  String? lastNameError;
  String? firstNameError;
  String? phoneError;
  String? cpswError;
  String? code = '+234';
  Map<String, bool> pswError = {
    'upper': false,
    'lower': false,
    'number': false,
    'symbol': false,
    'length': false,
  };

  RegisterRequest request = RegisterRequest();

  _setLoading(bool v) {
    isLoading = v;
    update();
  }

  setFirstName(String value) {
    valid = true;
    firstNameError = value.validate(key: 'name', isRequired: true);
    if (firstNameError == null) {
      request = request.copyWith(firstname: value);
    } else {
      valid = false;
    }
    update();
  }

  setLastName(String value) {
    valid = true;
    lastNameError = value.validate(key: 'name', isRequired: true);
    if (lastNameError == null) {
      request = request.copyWith(lastname: value);
    } else {
      valid = false;
    }
    update();
  }

  setEmail(String value) {
    valid = true;
    emailError = value.validate(key: 'email', isRequired: true);
    if (emailError == null) {
      request = request.copyWith(email: value);
    } else {
      valid = false;
    }
    update();
  }

  setPhoneNumber(String value) {
    valid = true;
    if (code == null) {
      valid = false;
      phoneError = 'Select country code!!';
    } else {
      request = request.copyWith(countryCode: code?.split('+').last);
      phoneError = value.validate(key: 'phone', isRequired: true);
      if (phoneError == null) {
        request = request.copyWith(phone: value);
      } else {
        valid = false;
      }
    }
    update();
  }

  setPassword(String value) {
    bool hasError = false;
    valid = true;
    pswError = value.passwordValidate;
    pswError.forEach((key, value) {
      hasError = pswError[key] == false;
    });
    if (!hasError) {
      request = request.copyWith(password: value);
    } else {
      valid = false;
    }
    update();
  }

  setConfirmPassword(String? value) {
    valid = true;
    cpswError = value == request.password ? null : 'Password mismatch';
    if (cpswError == null) {
      request = request.copyWith(confirmPassword: value);
    } else {
      valid = false;
    }
    update();
  }

  Future<void> submit() async {
    log(request.toString());

    log('context! = $context!');
    if (valid ?? false) {
      _setLoading(true);
      final response = await _authRepo.register(body: request);

      // log('response = $response');
      response.fold((l) {
        log('register error left $l');
        Get.snackbar(
          'Error',
          l.prettyMessage,
          icon: const Icon(Icons.error_outline),
          isDismissible: true,
          overlayColor: AppColor.danger,
          backgroundColor: AppColor.danger,
          padding: const EdgeInsets.all(8),
          shouldIconPulse: true,
          duration: const Duration(seconds: 1),
        );
      }, (r) {
        log('r.data?.data = ${r.data?.data}');
        AppRoute.navigateTo(
            route: Routes.OTP,
            argument: r.data?.data as TokenResponse,
            parameters: {
              'email': request.email ?? '',
              'route': Routes.SUCCESS.name,
            });
        Get.snackbar(
          'Success',
          r.data?.message ?? 'Account Created',
          icon: const Icon(Icons.check_circle_outline_outlined),
          isDismissible: true,
          backgroundColor: AppColor.success,
          padding: const EdgeInsets.all(8),
          shouldIconPulse: true,
          duration: const Duration(seconds: 1),
        );
      });
    }
    _setLoading(false);
  }
}
