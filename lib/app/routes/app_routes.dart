part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const onBoarding = _Paths.onBoarding;
  static const signUp = _Paths.signUp;
  static const signIn = _Paths.signIn;
  static const home = _Paths.home;
  static const pay = _Paths.pay;
  static const processComplete = _Paths.processComplete;
}

abstract class _Paths {
  _Paths._();

  static const onBoarding = "/on-boarding";
  static const signIn = "/sign-in";
  static const signUp = "/sign-up";
  static const home = "/home";
  static const pay = "/pay";
  static const processComplete = "/complete";
}
