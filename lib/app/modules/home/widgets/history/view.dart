import 'package:faith_fund/app/modules/home/home_data.dart';
import 'package:faith_fund/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'index.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HistoryViewGetX();
  }
}

class _HistoryViewGetX extends GetView<HistoryController> {
  const _HistoryViewGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF063D7D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff4091a5),
        centerTitle: true,
        title: Text(
          "Payment History",
          style: context.textTheme.bodyMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: controller.state.history.length,
          itemBuilder: (context, index) {
            return ListTile(
              shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                width: 15.w,
                color: const Color(0xFF063D7D),
              )),
              tileColor: const Color(0xFF042246),
              leading: SvgPicture.asset(Assets.iconsMoney),
              title: Text(
                controller.state.history[index].customerNumber ?? "",
                style:
                    context.textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
              subtitle: Text(
                controller.state.history[index].transType?.offeringType ?? "",
                style: context.textTheme.bodySmall?.copyWith(
                  color: Colors.white,
                ),
              ),
              trailing: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "GHS ${controller.state.history[index].amount}",
                    style: context.textTheme.bodyLarge
                        ?.copyWith(color: Colors.white, fontSize: 16.sp),
                  ),
                  Text(
                    DateFormat("dd/mm/yy hh:mm").format(
                        controller.state.history[index].date ?? DateTime.now()),
                    style: context.textTheme.bodySmall
                        ?.copyWith(color: Colors.white, fontSize: 16.sp),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
