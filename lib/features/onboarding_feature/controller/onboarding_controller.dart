import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/features/auth_feature/screen/login_screen.dart';
import 'package:graduation_final_project/features/onboarding_feature/data/onboarding_data.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChange(int index);
}

class OnBoardingControllerIMP extends OnBoardingController {
  late PageController pageController;
  int currentpage = 0;

  @override
  next() {
    currentpage++;
    if (currentpage > onBoardinglist.length - 1) {
      Get.offAll(const LoginScreen());
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChange(int index) {
    currentpage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  skiping() {
    Get.offAll(const LoginScreen());
  }
}
