import 'package:get/get.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/ui/authentication/forgot_password/forgot_password_binding.dart';
import 'package:jora_test/ui/authentication/forgot_password/forgot_password_view.dart';
import 'package:jora_test/ui/authentication/login/login_binding.dart';
import 'package:jora_test/ui/authentication/login/login_view.dart';
import 'package:jora_test/ui/authentication/otp/otp_binding.dart';
import 'package:jora_test/ui/authentication/otp/otp_view.dart';
import 'package:jora_test/ui/authentication/reset_password/reset_password_binding.dart';
import 'package:jora_test/ui/authentication/reset_password/reset_password_view.dart';
import 'package:jora_test/ui/authentication/signup/signup_binding.dart';
import 'package:jora_test/ui/authentication/signup/signup_view.dart';
import 'package:jora_test/ui/splash/splash_binding.dart';
import 'package:jora_test/ui/splash/splashscreen.dart';
import 'package:jora_test/ui/success/success_binding.dart';
import 'package:jora_test/ui/success/success_view.dart';

/// This manages all the application pages and routes
/// and the path to each pages are declaired
class AppRoute {
  /// This contains all the application pages and their qoutes
  static get routes => [
        GetPage(
          name: '/${Routes.SPLASH.name}',
          page: () => const SplashScreen(),
          transition: Transition.fadeIn,
          binding: SplashBinding(),
        ),
        GetPage(
          name: '/${Routes.LOGIN.name}',
          page: () => const LoginView(),
          transition: Transition.fadeIn,
          binding: LoginBinding(),
        ),
        GetPage(
          name: '/${Routes.REGISTER.name}',
          page: () => const SignupView(),
          transition: Transition.fadeIn,
          binding: SignupBinding(),
        ),
        GetPage(
          name: '/${Routes.FORGOT_PASSWORD.name}',
          page: () => const ForgotPasswordView(),
          transition: Transition.fadeIn,
          binding: ForgotPasswordBinding(),
        ),
        GetPage(
          name: '/${Routes.RESET_PASSWORD.name}',
          page: () => const ResetPasswordView(),
          transition: Transition.fadeIn,
          binding: ResetPasswordBinding(),
        ),
        GetPage(
          name: '/${Routes.OTP.name}',
          page: () => const OTPView(),
          transition: Transition.fadeIn,
          binding: OTPBinding(),
        ),
        GetPage(
          name: '/${Routes.SUCCESS.name}',
          page: () => const SuccessScreen(),
          transition: Transition.fadeIn,
          binding: SuccessBinding(),
        ),
      ];

  /// This nmethod navigates to the login page
  static navigateTo<T>({
    required Routes route,
    T? argument,
    Map<String, String>? parameters,
  }) =>
      Get.toNamed(
        '/${route.name}',
        arguments: argument as T,
        parameters: parameters,
        preventDuplicates: true,
      );

  /// This nmethod replace t
  static replaceWIth<T>({
    required Routes route,
    T? argument,
    Map<String, String>? parameters,
  }) =>
      Get.offAndToNamed(
        '/${route.name}',
        arguments: argument as T,
        parameters: parameters,
      );

  /// This nmethod replace t
  static clearRouteAndTo<T>({
    required Routes route,
    T? argument,
    Map<String, String>? parameters,
  }) =>
      Get.offNamedUntil(
        '/${route.name}',
        (route) => false,
        arguments: argument as T,
        parameters: parameters,
      );
}
