import 'package:get/get.dart';

import 'controller.dart';

class PayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PayController>(() => PayController());
  }
}
