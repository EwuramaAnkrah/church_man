import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() {
  runApp(const FaithFund());
}

class FaithFund extends StatelessWidget {
  const FaithFund({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 956),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        ensureScreenSize: true,
        builder: (context, _) => GetMaterialApp(
          title: 'Faith Fund',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: AppPages.initialPage,
          getPages: AppPages.routes,
          defaultTransition: Transition.fade,
        ),
      ),
    );
  }
}
