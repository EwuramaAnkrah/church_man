import 'package:faith_fund/app/core/theme/app_theme.dart';
import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:faith_fund/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await GetSecureStorage.init();
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
          theme: AppTheme.bDefaultTheme,
          initialRoute: AppPages.initialPage,
          getPages: AppPages.routes,
          defaultTransition: Transition.fade,
        ),
      ),
    );
  }
}
