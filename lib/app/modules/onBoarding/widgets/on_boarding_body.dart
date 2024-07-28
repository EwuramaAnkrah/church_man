import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/buttons/rm_button.dart';

import '../index.dart';

class OnBoardingBody extends GetView<OnboardingController> {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 20.w,
          right: 20.w,
          bottom: 100.h,
          child: Column(
            children: [
              RmButton(
                onTap: () => Get.toNamed(Routes.signUp),
                label: "Get Started",
                color: const Color(0xff4091a5),
                buttonCornerRadius: 15,
              ),
              Gap(15.h),
              RmButton(
                onTap: () => Get.toNamed(Routes.signIn),
                label: "Sign In",
                color: Colors.white,
                labelColor: Colors.black,
                buttonCornerRadius: 15,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment(0.0, -.4.h),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/logos/launch_no_text.png",
                  height: 150.h,
                ),
                Gap(20.h),
                Text(
                  "Welcome to Faith Fund",
                  style: context.textTheme.bodyLarge,
                ),
                Gap(10.h),
                Text(
                  "Nurturing souls, Guiding hearts, Empowering church ministry with purposeful connection and cheering giving.",
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
