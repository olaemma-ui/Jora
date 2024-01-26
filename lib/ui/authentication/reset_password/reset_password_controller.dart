import 'package:get/get.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/core/utils/app.route.dart';

class ResetPasswordController extends GetxController {
  /// Navigates to the Login page
  login() => Get.back();

  /// Navigates to the Login page
  success() => AppRoute.replaceWIth(route: Routes.SUCCESS, argument: {
        'message': 'You have successfully reset your password.',
        'btn_text': 'Sign In'
      });
}
