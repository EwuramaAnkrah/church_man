import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'index.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
            onPressed: () => controller.onBackTapped(),
          ),
          actions: [
            Obx(
              () => SizedBox(
                height: 20.h,
                width: 20.h,
                child: CircularProgressIndicator(
                  backgroundColor: const Color(0xffe1e1e6),
                  value: controller.state.currentStep.value,
                ),
              ),
            ),
            Gap(10.w),
          ],
        ),
        body: Obx(() => controller.state.currentStep.widget),
      ),
    );
  }
}
