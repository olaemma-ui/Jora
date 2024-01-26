import 'package:get/get.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/core/utils/app.route.dart';

class ForgotPasswordController extends GetxController {
  /// Navigates to the Login page
  login() => Get.back();

  /// Navigates to the Login page
  resetPassword() => AppRoute.replaceWIth(
        route: Routes.OTP,
        argument: 'olaemma4213@gmail.com',
      );
}
