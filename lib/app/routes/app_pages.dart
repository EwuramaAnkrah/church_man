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
    )
  ];
}
