import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:graduation_final_project/core/funcation/mymiddleware.dart';
import 'package:graduation_final_project/features/auth_feature/screen/login_screen.dart';
import 'package:graduation_final_project/features/auth_feature/screen/register_screen.dart';
import 'package:graduation_final_project/features/home_features/screen/mini_home_page.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: "/", page: () => const LoginScreen(), middlewares: [My_Middleware()]),
  GetPage(name: "/LoginScreen", page: () => const LoginScreen()),
  GetPage(name: "/RegisterScreen", page: () => const RegisterScreen()),
  GetPage(name: "/MainTabView", page: () => const MainTabView())
];
