import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:graduation_final_project/features/onboarding_feature/controller/onboarding_controller.dart';
import 'package:graduation_final_project/features/onboarding_feature/data/onboarding_data.dart';

class DurationOnBoarding extends StatefulWidget {
  const DurationOnBoarding({super.key});

  @override
  State<DurationOnBoarding> createState() => _DurationOnBoardingState();
}

class _DurationOnBoardingState extends State<DurationOnBoarding> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerIMP>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardinglist.length,
                    (index) => AnimatedContainer(
                          margin: const EdgeInsets.only(right: 4),
                          duration: const Duration(milliseconds: 200),
                          width: controller.currentpage == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: controller.currentpage != index
                                  ? const Color.fromARGB(255, 187, 187, 187)
                                  : const Color.fromARGB(255, 139, 241, 255),
                              borderRadius: BorderRadius.circular(10)),
                        ))
              ],
            )));
  }
}
