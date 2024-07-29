import 'package:faith_fund/app/modules/auth/sign_in/index.dart';
import 'package:faith_fund/app/modules/auth/sign_up/index.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/onBoarding/index.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initialPage = Routes.onBoarding;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: _Paths.onBoarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.signIn,
      page: () => const SignInPage(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: _Paths.signUp,
      page: () => const SignUpPage(),
      binding: SignUpBinding(),
    ),
  ];
}
