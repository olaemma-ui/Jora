import 'package:get/get.dart';
import 'package:jora_test/ui/authentication/otp/otp_controller.dart';

class OTPBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OTPController>(() => OTPController());
  }
}
