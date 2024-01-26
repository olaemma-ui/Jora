import 'package:get/get.dart';
import 'package:jora_test/core/constants/enums.dart';
import 'package:jora_test/core/utils/app.route.dart';

class SuccessController extends GetxController {
  /// Get started
  getStarted() => AppRoute.navigateTo(route: Routes.REGISTER);
}
