import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/curd.dart';
import 'package:graduation_final_project/core/class/statusrequest.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';
import 'package:graduation_final_project/core/funcation/handlingData.dart';
import 'package:graduation_final_project/features/auth_feature/Data/register_data.dart';

class Rigister_controller extends GetxController {
  StatusRequest? statusRequest = StatusRequest.none;
  final List<String> governorates = [
    "Select a Governorate",
    "Gharbia",
    "Alexandria",
    "Ismailia",
    "Kafr El Sheikh",
    "Aswan",
    "Assiut",
    "Luxor",
    "New Valley",
    "North Sinai",
    "Beheira",
    "Beni Suef",
    "Port Said",
    "Red Sea",
    "Giza",
    "Dakahlia",
    "South Sinai",
    "Damietta",
    "Sohag",
    "Suez",
    "Sharqia",
    "Fayoum",
    "Cairo",
    "Kalyubia",
    "Qena",
    "Matrouh",
    "Menoufia",
    "Minya",
  ];

  String selectedGovernorate = "Select a Governorate";

  gotopage() {
    Get.offNamed("LoginScreen");
  }

  bool maleSelected = false;
  bool femaleSelected = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> signupkey = new GlobalKey<FormState>();

  bool display = true;
  changedisplaypasswoed() {
    display = display == false ? true : false;

    update();
  }

  Curd curd = Curd();
  RegisterData registerData = RegisterData(Get.put(Curd()));
  List data = [];

  @override
  register() async {
    var formdata = signupkey.currentState;
    if (formdata!.validate()) {
      formdata.save();

      statusRequest = StatusRequest.loading;
      update();

      var response = await registerData.PostData(
          nameController.text,
          phoneController.text,
          addressController.text,
          selectedGovernorate,
          ageController.text,
          femaleSelected ? '1' : '0',
          maleSelected ? '1' : '0',
          emailController.text,
          passwordController.text);

      statusRequest = handlingData(response);

      if (statusRequest == StatusRequest.success) {
        if (response["message"] == "Registration successful") {
          print(response["message"]);
          Get.offNamed(AppRoutes.Login);
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "This email has already been used");
        }
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "This email has already been used");
      }
      update();
    } else {
      print("Not Valid");
    }
  }
}
