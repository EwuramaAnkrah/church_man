import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});

  Widget _buildView() {
    return const SignUpBody();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            height: 20.h,
            width: 20.h,
            child: const CircularProgressIndicator(
              backgroundColor: Color(0xffe1e1e6),
              value: 0,
            ),
          ),
          Gap(10.w),
        ],
      ),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }
}
