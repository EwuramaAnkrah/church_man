import 'package:faith_fund/app/modules/auth/sign_up/index.dart';
import 'package:get/get.dart';

class SignUpState {
  final Rx<SignUpStep> _currentStep = SignUpStep.emailStep.obs;
  SignUpStep get currentStep => _currentStep.value;
  set currentStep(SignUpStep step) => _currentStep.value = step;
}
