import 'package:faith_fund/app/modules/auth/sign_up/widgets/sign_up_body.dart';
import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:faith_fund/app/services/firebase/firebase_auth_service.dart';
import 'package:faith_fund/app/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/network/log_all_the_time_filter.dart';

import 'index.dart';

class SignUpController extends GetxController {
  final log = rmGetLogger("Sign up controller");
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  final TextEditingController confirmPassController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  final state = SignUpState();

  final _firebaseService = FirebaseAuthService();
  final _storageService = StorageService();

  void updateSignUpStep() async {
    bool isValidated(GlobalKey<FormState> formKey) =>
        formKey.currentState?.validate() ?? false;

    if (isValidated(emailFormKey)) {
      state.currentStep = SignUpStep.nameStep;
    } else if (isValidated(nameFormKey)) {
      state.currentStep = SignUpStep.passwordStep;
    } else if (isValidated(passwordFormKey)) {
      await registerUserWithEmailAndPassword();
    }
  }

  Future<void> registerUserWithEmailAndPassword() async {
    try {
      state.isLoading = true;
      final response = await _firebaseService.createUserWithEmailAndPassword(
          emailController.text.trim(), confirmPassController.text.trim());

      if (response.hasError ?? true) {
        log.i(response.errorMessage);
        return;
      }
      await _firebaseService.updateDisplayName(
          "${firstNameController.text.trim()} ${lastNameController.text.trim()}");
      await _firebaseService.sendEmailVerificationLink();

      await _storageService.saveUserToken(response.userInfo?.uid ?? "");
      state.currentStep = SignUpStep.completedStep;
    } finally {
      state.isLoading = false;
    }
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

  void goToHomePageWithValidUpdatedUser() {
    final User? user = _firebaseService.isUserSignedIn();

    if (user != null) {
      Get.offAllNamed(Routes.home/*, arguments: user*/);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    passwordController.dispose();
    confirmPassController.dispose();
    super.onClose();
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
