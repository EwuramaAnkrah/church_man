import 'package:faith_fund/app/modules/auth/sign_up/widgets/sign_up_body.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignUpController extends GetxController {
  SignUpController();

  final state = SignUpState();

  void updateSignUpStep(SignUpStep currentStep) {
    state.currentStep = currentStep;
  }

  void onBackTapped() {
    switch (state.currentStep) {
      case SignUpStep.emailStep:
        Get.back();
        break;
      case SignUpStep.nameStep:
        state.currentStep = SignUpStep.emailStep;
        break;
      case SignUpStep.passwordStep:
        state.currentStep = SignUpStep.nameStep;
        break;
      case SignUpStep.completedStep:
        state.currentStep = SignUpStep.passwordStep;
        break;
    }
  }
}

enum SignUpStep {
  emailStep(value: 1 / 4, widget: SignUpBody()),
  nameStep(value: 2 / 4, widget: RegistrationFullName()),
  passwordStep(value: 3 / 4, widget: RegistrationPassword()),
  completedStep(value: 4 / 4, widget: RegistrationComplete());

  const SignUpStep({required this.value, required this.widget});

  final double value;
  final Widget widget;
}
