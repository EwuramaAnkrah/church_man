import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:faith_fund/app/services/firebase/firebase_auth_service.dart';
import 'package:faith_fund/app/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/network/log_all_the_time_filter.dart';

import 'index.dart';

class SignInController extends GetxController {
  var log = rmGetLogger("Sign in controller");
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final state = SignInState();

  void signInFaithUser() async {
    try {
      state.isLoading = true;

      if (signInKey.currentState?.validate() ?? false) {
        FireAuthServiceResponse response = await FirebaseAuthService()
            .signInUserWithEmailAndPassword(
                emailController.text.trim(), passwordController.text.trim());

        if (response.hasError ?? true) {
          log.i(response.errorMessage);
          return;
        }
        await StorageService().saveUserToken(response.userInfo?.uid ?? "");
        Get.offAllNamed(Routes.home);
      }
    } finally {
      state.isLoading = false;
    }
  }
}
