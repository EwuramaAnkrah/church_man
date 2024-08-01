import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:faith_fund/app/services/firebase_service.dart';
import 'package:faith_fund/app/services/storage_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {

    String? userToken = StorageService().getUserToken();

    if (userToken != null) {
      return const RouteSettings(name: Routes.home);
    }

    return null;

  }
}
