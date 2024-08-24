import 'package:faith_fund/app/modules/pay/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:get/route_manager.dart';
import 'package:rmdev_widgets/buttons/rm_button.dart';

import '../../routes/app_pages.dart';

class ProcessCompleteView extends GetView<PayController> {
  const ProcessCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 41.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "🙏🏾",
                style: context.textTheme.bodyLarge?.copyWith(fontSize: 52.sp),
              ),
              Text(
                "Thank you for your generosity",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              13.verticalSpace,
              Text(
                "Your donation will go a long way to support the Lord's work",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 16.sp,
                    ),
                textAlign: TextAlign.center,
              ),
              62.verticalSpace,
              RmButton(
                onTap: () => Get.offNamed(Routes.home),
                label: "Done",
                color: const Color(0xff4091a5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
