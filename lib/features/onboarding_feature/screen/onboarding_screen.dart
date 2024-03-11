import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/onboarding_feature/controller/onboarding_controller.dart';
import 'package:graduation_final_project/features/onboarding_feature/widgets/continuebotton.dart';
import 'package:graduation_final_project/features/onboarding_feature/widgets/onboardingviwe.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({Key? key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    Get.put(OnBoardingControllerIMP());

    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: height * 0.1,
            width: double.infinity,
            color: AppColor.primaryColor,
            child: Container(
              height: 15,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.vertical(
                  top: Radius.elliptical(
                    MediaQuery.of(context).size.width,
                    50.0,
                  ),
                ),
              ),
            ),
          ),
          const Expanded(child: OnBoardingView()),
          const ContinueBottonOnboarding()
        ],
      ),
    );
  }
}
