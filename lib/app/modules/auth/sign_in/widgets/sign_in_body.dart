import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/buttons/rm_button.dart';
import 'package:rmdev_widgets/text_fields/rm_textfield.dart';

import '../index.dart';

/// hello
class SignInBody extends GetView<SignInController> {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/logos/logo_trans.png",
            height: 170.h,
          ),
          Gap(40.h),
          RmTextFormField(
            fieldBorderRadius: 15,
            contentPaddingLeft: 15,
            contentPaddingTop: 15,
            contentPaddingBottom: 15,
            contentPaddingRight: 15,
            hintText: "Email Address",
            hintTextColor: const Color.fromARGB(255, 158, 158, 161),
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            onChanged: (value) {},
          ),
          Gap(20.h),
          RmTextFormField(
            obscureText: true,
            textInputAction: TextInputAction.done,
            fieldBorderRadius: 15,
            contentPaddingLeft: 15,
            contentPaddingTop: 15,
            contentPaddingBottom: 15,
            contentPaddingRight: 15,
            hintText: "Password",
            hintTextColor: const Color.fromARGB(255, 158, 158, 161),
            onChanged: (value) {},
          ),
          Gap(40.h),
          RmButton(
            onTap: () {},
            label: "Sign In",
            color: const Color(0xff4091a5),
          ),
          Gap(20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120.w,
                height: 1.h,
                color: const Color(0xffe1e1e6),
              ),
              Gap(10.w),
              Image.asset(
                "assets/logos/launch_no_text.png",
                height: 25.h,
                color: const Color(0xffe1e1e6),
              ),
              Gap(10.w),
              Text(
                "OR",
                style: context.textTheme.bodyMedium
                    ?.copyWith(color: const Color.fromARGB(255, 158, 158, 161)),
              ),
              Gap(10.w),
              Image.asset(
                "assets/logos/launch_no_text.png",
                height: 25.h,
                color: const Color(0xffe1e1e6),
              ),
              Gap(10.w),
              Container(
                width: 120.w,
                height: 1.h,
                color: const Color(0xffe1e1e6),
              ),
            ],
          ),
          Gap(40.h),
          RmButton(
            onTap: () {},
            color: Colors.white,
            side: BorderSide(
              width: 1.w,
              color: const Color(0xffe1e1e6),
            ),
            child: SizedBox(
              height: 60.h,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/logos/google-logo.png",
                      height: 35.h,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Continue with Google",
                      style: context.textTheme.bodyMedium,
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
