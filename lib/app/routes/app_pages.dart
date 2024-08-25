import 'package:faith_fund/app/modules/auth/sign_in/index.dart';
import 'package:faith_fund/app/modules/auth/sign_up/index.dart';
import 'package:faith_fund/app/modules/home/index.dart';
import 'package:faith_fund/app/modules/pay/index.dart';
import 'package:faith_fund/app/modules/process_complete/process_complete_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/home/widgets/history/index.dart';
import '../modules/onBoarding/index.dart';
import 'auth_middleware.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initialPage = Routes.onBoarding;

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: _Paths.onBoarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
      middlewares: [AuthMiddleware()],
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
    GetPage(
      name: _Paths.home,
      page: () => const HomePage(),
      bindings: [HomeBinding(), HistoryBinding(),],
    ),
    GetPage(
      name: _Paths.pay,
      page: () => const PayPage(),
      binding: PayBinding(),
    ),
    GetPage(
      name: _Paths.processComplete,
      page: () => const ProcessCompleteView(),
      binding: PayBinding(),
    ),
  ];
}
