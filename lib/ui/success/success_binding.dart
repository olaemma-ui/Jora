import 'package:get/get.dart';
import 'package:jora_test/ui/success/success_controller.dart';

class SuccessBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<SuccessController>(() => SuccessController());
  }
}
