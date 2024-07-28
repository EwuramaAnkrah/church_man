import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class OnBoardingBody extends GetView<OnboardingController> {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Text(controller.state.title)),
    );
  }
}
