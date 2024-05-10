import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';
import 'package:graduation_final_project/features/auth_feature/screen/login_screen.dart';
import 'package:graduation_final_project/features/auth_feature/screen/register_screen.dart';
import 'package:graduation_final_project/features/home_features/screen/home_page.dart';
import 'package:graduation_final_project/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home_features/screen/mini_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: isLoggedIn ? MainTabView() : LoginScreen(),
        getPages: routes,
      ),
    );
  }
}
