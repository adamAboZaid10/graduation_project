import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/curd.dart';
import 'package:graduation_final_project/core/class/statusrequest.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';
import 'package:graduation_final_project/core/funcation/handlingData.dart';
import 'package:graduation_final_project/features/auth_feature/Data/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginController extends GetxController {
  login();
  gotopage();
}

class LoginControllerImp extends LoginController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  StatusRequest? statusRequest = StatusRequest.none;

  LoginControllerImp(this.formKey);

  final GlobalKey<FormState> formKey;

  Curd curd = Curd();

  LoginData sigupData = LoginData(Get.put(Curd()));
  List data = [];

  bool display = true;

  @override
  gotopage() {
    Get.offNamed(AppRoutes.RegisterScreen);
  }

  @override
  login() async {
    var formdata = formKey.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print("Valid");

      statusRequest = StatusRequest.loading;
      update();
      var response = await sigupData.PostData(
          emailController.text, passwordController.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["message"] == "Patient login successful") {
          Get.offNamed(AppRoutes.MainTabView);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIn', true);
          await prefs.setString("id", response["data"]["id"].toString());
          String userid = prefs.getString("id")!;
          await prefs.setString("name", response["data"]["name"].toString());
          String name = prefs.getString("name")!;
          await prefs.setString("token", response["data"]["token"].toString());
          String token = prefs.getString("token")!;
          await prefs.setString("email", response["data"]["email"].toString());
          String email = prefs.getString("email")!;
        } else if (response["message"] == "Doctor login successful") {
          Get.offNamed(AppRoutes.DashbordHomeScreen);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setBool('isLoggedIndashbord', true);
          await prefs.setString("id", response["data"]["id"].toString());
          String userid = prefs.getString("id")!;
          await prefs.setString("name", response["data"]["name"].toString());
          String name = prefs.getString("name")!;
          await prefs.setString("token", response["data"]["token"].toString());
          String token = prefs.getString("token")!;
          print(token);
          await prefs.setString("email", response["data"]["email"].toString());
          String email = prefs.getString("email")!;
          print("0987");
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText:
                  "There is no account with this email\n Or the password is incorrect");
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  changedisplaypasswoed() {
    display = display == false ? true : false;

    update();
  }
}
