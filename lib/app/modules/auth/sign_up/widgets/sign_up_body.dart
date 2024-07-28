import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// hello
class SignUpBody extends GetView<SignUpController> {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Obx(() => Text(controller.state.title)),
    );
  }
}
