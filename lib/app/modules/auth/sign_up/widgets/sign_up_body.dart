import 'package:faith_fund/app/modules/auth/sign_up/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/buttons/rm_button.dart';
import 'package:rmdev_widgets/form_validator.dart';
import 'package:rmdev_widgets/text_fields/rm_textfield.dart';

import '../index.dart';

class SignUpBody extends GetView<SignUpController> {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Text(
                    "Provide email address will you like to use with your account",
                    style: context.textTheme.bodyLarge?.copyWith(
                      fontSize: 20.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(10.h),
                  Text(
                    "We will send you a verification link",
                    style:
                        context.textTheme.bodySmall?.copyWith(fontSize: 15.sp),
                  )
                ],
              ),
            ),
            Gap(20.h),
            Form(
              key: controller.emailFormKey,
              child: RmTextFormField(
                hintText: "Enter email address",
                controller: controller.emailController,
                fieldBorderRadius: 15,
                hintTextColor: const Color.fromARGB(255, 158, 158, 161),
                textInputType: TextInputType.emailAddress,
                contentPaddingBottom: 15,
                contentPaddingLeft: 15,
                contentPaddingRight: 15,
                contentPaddingTop: 15,
                validator: (value) =>
                    RmFormValidator.emailValidator.call(value),
              ),
            ),
            Gap(20.h),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: context.textTheme.bodySmall?.copyWith(
                    color: const Color.fromARGB(255, 158, 158, 161),
                    fontSize: 12.sp),
                text: "By providing your information, you're agreeing to our ",
                children: [
                  TextSpan(
                    text: "Terms of Service",
                    style: context.textTheme.bodySmall?.copyWith(
                        color: const Color(0xff4091a5),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: " and "),
                  TextSpan(
                    text: "Privacy Policy",
                    style: context.textTheme.bodySmall?.copyWith(
                      color: const Color(0xff4091a5),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            Gap(20.h),
            RmButton(
              onTap: () => controller.updateSignUpStep(),
              label: "Continue",
              color: const Color(0xff4091a5),
            ),
            Gap(30.h),
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
                  style: context.textTheme.bodyMedium?.copyWith(
                      color: const Color.fromARGB(255, 158, 158, 161)),
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
            Gap(20.h),
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
                        height: 25.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Continue with Google",
                        style: context.textTheme.bodyMedium
                            ?.copyWith(fontSize: 16.sp),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationFullName extends GetView<SignUpController> {
  const RegistrationFullName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Profile photo and Name",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontSize: 20.sp,
                ),
                textAlign: TextAlign.center,
              ),
              Gap(10.h),
              Text(
                "Upload a photo and enter your full name",
                style: context.textTheme.bodySmall?.copyWith(fontSize: 15.sp),
              ),
              Gap(30.h),
              Container(
                height: 120.h,
                width: 120.h,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xffe1e1e6)),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_rounded,
                    size: 30.sp,
                  ),
                ),
              ),
              Gap(40.h),
              Form(
                key: controller.nameFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RmTextFormField(
                      hintText: "Enter first name",
                      controller: controller.firstNameController,
                      fieldBorderRadius: 15,
                      hintTextColor: const Color.fromARGB(255, 158, 158, 161),
                      textInputType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      contentPaddingBottom: 15,
                      contentPaddingLeft: 15,
                      contentPaddingRight: 15,
                      contentPaddingTop: 15,
                      validator: (value) =>
                          RmFormValidator.requiredValidator.call(value),
                    ),
                    Gap(16.h),
                    RmTextFormField(
                      hintText: "Enter last name",
                      controller: controller.lastNameController,
                      fieldBorderRadius: 15,
                      hintTextColor: const Color.fromARGB(255, 158, 158, 161),
                      textInputType: TextInputType.emailAddress,
                      contentPaddingBottom: 15,
                      contentPaddingLeft: 15,
                      contentPaddingRight: 15,
                      contentPaddingTop: 15,
                      validator: (value) =>
                          RmFormValidator.requiredValidator.call(value),
                    ),
                  ],
                ),
              ),
              Gap(20.h),
              RmButton(
                onTap: () => controller.updateSignUpStep(),
                label: "Continue",
                color: const Color(0xff4091a5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegistrationPassword extends GetView<SignUpController> {
  const RegistrationPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              "Create a password",
              style: context.textTheme.bodyLarge?.copyWith(
                fontSize: 20.sp,
              ),
              textAlign: TextAlign.center,
            ),
            Gap(10.h),
            Text(
              "Create to further secure you account",
              style: context.textTheme.bodySmall?.copyWith(fontSize: 15.sp),
              textAlign: TextAlign.center,
            ),
            Gap(50.h),
            Form(
              key: controller.passwordFormKey,
              child: Column(
                children: [
                  RmTextFormField(
                    hintText: "Enter password",
                    maxLines: 1,
                    controller: controller.passwordController,
                    fieldBorderRadius: 15,
                    obscureText: true,
                    hintTextColor: const Color.fromARGB(255, 158, 158, 161),
                    textInputAction: TextInputAction.next,
                    contentPaddingBottom: 15,
                    contentPaddingLeft: 15,
                    contentPaddingRight: 15,
                    contentPaddingTop: 15,
                    validator: (value) =>
                        RmFormValidator.strongPasswordValidator.call(value),
                  ),
                  Gap(16.h),
                  RmTextFormField(
                    hintText: "Confirm password",
                    maxLines: 1,
                    controller: controller.confirmPassController,
                    fieldBorderRadius: 15,
                    obscureText: true,
                    hintTextColor: const Color.fromARGB(255, 158, 158, 161),
                    contentPaddingBottom: 15,
                    contentPaddingLeft: 15,
                    contentPaddingRight: 15,
                    contentPaddingTop: 15,
                    validator: (value) => RmFormValidator.validatePasswordMatch(
                            controller.passwordController.text,
                            controller.confirmPassController.text)
                        .call(value),
                  ),
                ],
              ),
            ),
            Gap(20.h),
            RmButton(
              onTap: () => controller.updateSignUpStep(),
              label: "Continue",
              color: const Color(0xff4091a5),
            ),
          ],
        ),
      ),
    );
  }
}

class RegistrationComplete extends GetView<SignUpController> {
  const RegistrationComplete({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: Stack(
        children: [
          Positioned(
            top: 100.h,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "🎉 Welcome to Faith Fund 🎉",
                  style: context.textTheme.bodyLarge?.copyWith(fontSize: 22.sp),
                ),
                Gap(15.h),
                Text(
                  "Thank you for your divine dedication to the Faith Fund. Your generosity is a true blessing!",
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                Gap(80.h),
                Text(
                  "A verification link has been sent to the email you provided. Click on the link to verify your identity.",
                  style: context.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              return RmButton(
                isLoading: controller.state.isLoading,
                onTap: () => controller.goToHomePageWithValidUpdatedUser(),
                label: "Continue",
                color: const Color(0xff4091a5),
              );
            }),
          )
        ],
      ),
    );
  }
}
