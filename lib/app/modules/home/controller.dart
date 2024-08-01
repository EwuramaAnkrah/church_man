import 'package:faith_fund/app/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'index.dart';

class HomeController extends GetxController {

  final state = HomeState();

  final Rxn<User?> _faithUser = Rxn<User?>(null);
  User? get faithUser => _faithUser.value;

  @override
  void onInit() {

    // if (Get.arguments != null) {
      _faithUser.bindStream(FirebaseService().userStateChanges());
    // }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
