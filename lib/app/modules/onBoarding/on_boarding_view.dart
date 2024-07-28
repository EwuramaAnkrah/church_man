import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("onboarding")),
          body: const SafeArea(
            child: OnBoardingBody(),
          ),
        );
      },
    );
  }
}
