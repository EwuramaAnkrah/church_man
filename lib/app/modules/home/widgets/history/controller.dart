import 'package:get/get.dart';

class HistoryController extends GetxController {
  HistoryController();

  _initData() {
    update(["history"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
