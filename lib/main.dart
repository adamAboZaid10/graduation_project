import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/features/auth_feature/screen/login_screen.dart';
import 'package:graduation_final_project/features/doctordashbord/dashbordhome.dart';
import 'package:graduation_final_project/features/doctordashbord/doctordashbord.dart';
import 'package:graduation_final_project/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home_features/screen/mini_home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;
  bool isLoggedIndashbord = prefs.getBool("isLoggedIndashbord") ?? false;
  runApp(MyApp(isLoggedIn: isLoggedIn, isLoggedIndashbord: isLoggedIndashbord));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  final bool isLoggedIndashbord;

  const MyApp({
    Key? key,
    required this.isLoggedIn,
    required this.isLoggedIndashbord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget homeScreen;

    if (isLoggedIn) {
      homeScreen = MainTabView();
    } else if (isLoggedIndashbord) {
      homeScreen = DashbordHomeScreen();
    } else {
      homeScreen = LoginScreen();
    }
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: homeScreen,
          getPages: routes,
        );
      },
    );
  }
}
