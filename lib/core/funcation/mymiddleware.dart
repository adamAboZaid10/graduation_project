import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';

class My_Middleware extends GetMiddleware {
  int? priority = 1;
  SharedPreferences? prefs;

  My_Middleware() {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
  }

  @override
  RouteSettings? redirect(String? route) {
    if (prefs?.getBool("isLoggedIn") == true) {
      return const RouteSettings(name: AppRoutes.MainTabView);
    }
    return null;
  }
}
