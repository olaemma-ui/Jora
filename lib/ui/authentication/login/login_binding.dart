import 'package:get/get.dart';
import 'package:jora_test/ui/authentication/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(Get.context!));
  }
}
