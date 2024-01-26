import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jora_test/app/app.locator.dart';
import 'package:jora_test/core/constants/app_colors.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/core/utils/app.route.dart';
import 'package:jora_test/model/request/otp_verification.dart';
import 'package:jora_test/model/response/register_response.dart';
import 'package:jora_test/repository/auth_repo/auth_repo.dart';

class OTPController extends GetxController {
  final _authRepo = locator<AuthenticationRepo>();

  String? _counter;
  bool pressed = true;

  String? _otp;
  String? get otp => _otp;
  setOtp(String? v) {
    _otp = v;
    log('_otp = $_otp');
  }

  String? _otpError;
  String? get otpError => _otpError;
  set setOtpError(String v) => _otpError;

  String? get counter => _counter;
  setCounter(String value) => _counter = value;

  String get email => Get.parameters['email'] ?? '';
  TokenResponse get _tokenResponse => Get.arguments as TokenResponse;

  /// Navigates back to login
  login() => Get.back();

  bool isLoading = false;

  _setLoading(bool v) {
    isLoading = v;
    update();
  }

  int sec = 0;
  int min = 0;
  Timer? _timer;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // count();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _timer?.cancel();
    _timer = null;
  }

  void count() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (pressed) {
        sec++;
        if (sec >= 59) {
          sec = 0;
          min++;
        }
        _counter = '$min:${sec < 10 ? '0$sec' : sec}';
        if (min == 3) {
          _counter = null;
          pressed = false;
          _timer?.cancel();
          _timer = null;
        }

        log('counter = $_counter');
        update();
      }
      // log('t = $t');
    });
  }

  OtpVerification request = OtpVerification();

  Future<void> resend() async {
    pressed = true;
    count();
    // _setLoading(false);
    final response = await _authRepo.resendVerificationEmail(_tokenResponse);
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
    }, (r) {
      Get.snackbar(
        'Success',
        r.data?.message ?? 'Verification code resent to your email',
        icon: const Icon(Icons.check_circle_outline_outlined),
        isDismissible: true,
        backgroundColor: AppColor.success,
        padding: const EdgeInsets.all(8),
        shouldIconPulse: true,
        duration: const Duration(seconds: 2),
      );
    });
  }

  Future<void> verify() async {
    log('token = $_tokenResponse');
    if (otp != null) {
      request = request.copyWith(code: otp);
      final response = await _authRepo.verify(
        body: request,
        tokenResponse: _tokenResponse,
      );

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
      }, (r) {
        AppRoute.replaceWIth(
          route: Routes.values
              .where((element) => element.name == Get.parameters['route'])
              .first,
        );
        Get.snackbar(
          'Success',
          r.data?.message ?? 'Account Verified',
          icon: const Icon(Icons.check_circle_outline_outlined),
          isDismissible: true,
          backgroundColor: AppColor.success,
          padding: const EdgeInsets.all(8),
          shouldIconPulse: true,
          duration: const Duration(seconds: 2),
        );
      });

      _setLoading(false);
    }
  }
}
