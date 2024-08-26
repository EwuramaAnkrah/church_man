import 'package:faith_fund/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class PayPage extends GetView<PayController> {
  const PayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: const Color(0xfff9f9f9),
          appBar: AppBar(
            title: Row(
              children: [
                Image.asset(Assets.logosLaunchNoText, height: 50.h,),
                Text("Faith ${controller.state.service.type?.name.capitalize}"),
              ],
            ),
          ),
          body: const PayBody(),
        );
  }
}
