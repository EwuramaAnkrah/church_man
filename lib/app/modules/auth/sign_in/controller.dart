import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:faith_fund/app/services/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        FirebaseServiceResponse response = await FirebaseService().signInUserWithEmailAndPassword(
            emailController.text.trim(), passwordController.text.trim());

        if (response.hasError ?? true) {
          log.i(response.errorMessage);
          return;
        }
        Get.offAllNamed(Routes.home);
      }
    } finally {
      state.isLoading = false;
    }
  }
}
