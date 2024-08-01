import 'package:faith_fund/app/modules/home/home_data.dart';
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
    return SafeArea(
      child: Padding(
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
                  // color: const Color(0xffffffff),
                  // border: Border.all(
                  //   width: 2.w,
                  //   strokeAlign: BorderSide.strokeAlignOutside,
                  //   color: const Color(0xFFF4F4F4),
                  // ),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              height: 150.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0x24ffffff),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...serviceList.map(
                    (service) => Container(
                      width: 118.w,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        // border: Border.all(
                        //     width: 2.w,
                        //     strokeAlign: BorderSide.strokeAlignOutside,
                        //     color: const Color(0xFFF4F4F4)),
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10.h,
                            left: 10.w,
                            child: SvgPicture.asset(
                              service.icon,
                              height: 30.h,
                              color: Colors.black,
                            ),
                          ),
                          Align(
                            alignment: Alignment(-.6.w, 0),
                            child: Text(
                              service.title,
                              style: context.textTheme.bodySmall?.copyWith(
                                fontSize: 16.sp,
                              ),
                              textAlign: TextAlign.left,
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
                                color: Color(0xFFF4F4F4),
                              ),
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 20.sp,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(30.h),
            Container(
              clipBehavior: Clip.antiAlias,
              height: 150.h,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: const Color(0xff37A0B9),
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Image.asset(
                      "assets/images/Mask-group.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    left: 10.w,
                    child: SvgPicture.asset("assets/icons/History.svg"),
                  ),
                  Positioned(
                    bottom: 25.h,
                    right: 20.h,
                    child: Container(
                      height: 40.h,
                      width: 40.h,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0x94ffffff),
                      ),
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    right: 100.w,
                    child: Text(
                      "GHS2,599.89",
                      style: context.textTheme.bodyLarge
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-1.w, 0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/tithe.svg",
                          height: 30.sp,
                        ),
                        Gap(15.w),
                        Text("Tithe",
                            style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.white, fontSize: 26.sp)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
