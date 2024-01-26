import 'package:get/get.dart';
import 'package:jora_test/ui/authentication/login/login_controller.dart';
import 'package:jora_test/ui/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
