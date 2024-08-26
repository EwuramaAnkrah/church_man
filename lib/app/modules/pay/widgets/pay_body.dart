import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/buttons/rm_button.dart';
import 'package:rmdev_widgets/form_validator.dart';
import 'package:rmdev_widgets/text_fields/rm_textfield_with_label.dart';

import '../../../../generated/assets.dart';
import '../index.dart';

class PayBody extends GetView<PayController> {
  const PayBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Container(
              height: 138.h,
              width: double.maxFinite,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xffc8f2ff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 35.w,
                    bottom: 0,
                    child: Image.asset(
                      Assets.imagesPayIllustration,
                      height: 130.h,
                    ),
                  ),
                  Positioned(
                    top: 35.h,
                    left: 16.w,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pay now",
                          style: TextStyle(
                            fontFamily: 'Champ',
                            fontWeight: FontWeight.w900,
                            fontSize: 37.sp,
                            color: const Color(0xff4091a5),
                          ),
                        ),
                        Text(
                          "Quick and easy payments.",
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff4091a5),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(26.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 28.h),
              width: double.maxFinite,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Form(
                key: controller.state.payFormKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return RmLabelTextField(
                        onInputChanged: (value) {},
                        hintText: controller.state.service.title,
                        label: "Donation type",
                        filled: true,
                        fillColor: const Color(0xfff2f2f2),
                        hideBorder: true,
                        fieldBorderRadius: 8.r,
                        isReadOnly: true,
                        hintTextColor: const Color(0xffbbbbbb),
                      );
                    }),
                    Gap(16.h),
                    RmLabelTextField(
                      onTap: () => _serviceProvidersBottomSheet(context),
                      controller: controller.state.networkController,
                      onInputChanged: (value) {},
                      label: "Select network",
                      hintText: "--Select Network--",
                      hintTextColor: const Color(0xffbbbbbb),
                      isDropDown: true,
                      validator: RmFormValidator.requiredValidator.call,
                    ),
                    Gap(16.h),
                    RmLabelTextField(
                      controller: controller.state.phoneNumberController,
                      onInputChanged: (value) =>
                          controller.onPhoneNumberChanged(value.trim()),
                      label: "Phone number",
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(10),
                      ],
                      textInputType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      hintTextColor: const Color(0xffbbbbbb),
                      validator: RmFormValidator.phoneNumberValidator.call,
                    ),
                    Gap(16.h),
                    RmLabelTextField(
                      controller: controller.state.amountController,
                      onInputChanged: (value) =>
                          controller.onAmountChanged(value.trim()),
                      label: "Amount",
                      textInputType:
                          const TextInputType.numberWithOptions(decimal: true),
                      hintText: "Enter Amount",
                      textInputAction: TextInputAction.next,
                      hintTextColor: const Color(0xffbbbbbb),
                      validator: RmFormValidator.validateAmount(
                              controller.state.paymentInfo.amount ?? "", 0.1)
                          .call,
                    ),
                    Gap(16.h),
                    RmLabelTextField(
                      controller: controller.state.referenceController,
                      onInputChanged: (value) =>
                          controller.onReferenceChanged(value.trim()),
                      label: "Reference",
                      hintText: "Enter Reference",
                      textInputAction: TextInputAction.done,
                      hintTextColor: const Color(0xffbbbbbb),
                      validator: RmFormValidator.requiredValidator.call,
                    ),
                    Gap(16.h),
                    Obx(
                      () => RmButton(
                        onTap: () => controller.makeDonationRequest(),
                        isLoading: controller.state.isProcessing,
                        label: "Donate",
                        buttonCornerRadius: 10.r,
                        color: const Color(0xff4091a5),
                      ),
                    ),
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

_serviceProvidersBottomSheet(BuildContext context) {
  var controller = Get.find<PayController>();
  return showModalBottomSheet(
    context: context,
    builder: (_) => Container(
      height: 300.h,
      width: double.maxFinite,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16.r),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: serviceProviderList.length,
              itemBuilder: (context, index) => Container(
                color: const Color(0xfff9f9f9),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                margin: EdgeInsets.only(bottom: 10.h),
                child: ListTile(
                  onTap: () => controller.onServiceProviderSelected(
                    serviceProviderList[index],
                  ),
                  title: Text(
                    serviceProviderList[index].desc,
                    style: context.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
