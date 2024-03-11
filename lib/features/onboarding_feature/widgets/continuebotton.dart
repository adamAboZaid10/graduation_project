import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/onboarding_feature/controller/onboarding_controller.dart';

class ContinueBottonOnboarding extends GetView<OnBoardingControllerIMP> {
  const ContinueBottonOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      width: width,
      height: height * 0.1,
      child: Column(
        children: [
          Container(
            width: width * .4,
            child: MaterialButton(
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              onPressed: () {
                controller.next();
              },
              color: AppColor.primaryColor,
              child: const Text(
                "Continue",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
