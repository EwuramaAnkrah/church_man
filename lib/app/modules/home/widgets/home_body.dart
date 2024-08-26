import 'package:faith_fund/app/modules/home/home_data.dart';
import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:faith_fund/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../index.dart';

class HomeBody extends GetView<HomeController> {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF063D7D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        backgroundColor: const Color(0xff4091a5),
        title: Obx(() => Text(
              "Hello ${controller.faithUser?.displayName?.split(" ").first}",
              style:
                  context.textTheme.bodyMedium?.copyWith(color: Colors.white),
            )),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              height: 280.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0x24ffffff),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10.h,
                      left: 10.w,
                      child: const Text("Verse of the day"),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '''"And seven women shall take hold of one man in that day, saying, We will eat our own bread, and wear our own apparel: only let us be called by thy name, take away our reproach."''',
                        style: GoogleFonts.bonaNova(
                            height: 1.2.h,
                            fontSize: 22.sp,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      bottom: 10.h,
                      right: 0.w,
                      child: Text(
                        "Isiah 4:1",
                        style: context.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Gap(30.h),
            Column(
              children: [
                ...serviceList.map(
                  (service) => Container(
                    margin: EdgeInsets.only(bottom: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                    height: 120.h,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: const Color(0x24ffffff),
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: InkWell(
                      onTap: () => Get.toNamed(Routes.pay, arguments: service),
                      child: Container(
                        width: 88.w,
                        height: double.maxFinite,
                        decoration: BoxDecoration(
                          color: const Color(0xff37A0B9),
                          borderRadius: BorderRadius.circular(25.r),
                        ),
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                Assets.imagesMaskGroup,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 20.w,
                              top: 20.h,
                              bottom: 20.h,
                              child: Row(
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 50.h,
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffffffff),
                                        borderRadius:
                                            BorderRadius.circular(10.r)),
                                    child: SvgPicture.asset(
                                      service.icon ?? Assets.iconsOffering,
                                      height: 30.h,
                                      color: const Color(0xff4091a5),
                                    ),
                                  ),
                                  20.horizontalSpace,
                                  Text(
                                    service.title ?? "",
                                    style:
                                        context.textTheme.bodySmall?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 10.h,
                              right: 10.w,
                              child: Container(
                                height: 30.h,
                                width: 30.h,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color(0xffffffff),
                                ),
                                child: Icon(
                                  Icons.arrow_forward_rounded,
                                  size: 20.sp,
                                  color: const Color(0xff4091a5),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(30.h),
          ],
        ),
      ),
    );
  }
}
