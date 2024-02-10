import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/features/onboarding_feature/controller/onboarding_controller.dart';
import 'package:graduation_final_project/features/onboarding_feature/data/onboarding_data.dart';
import 'package:graduation_final_project/features/onboarding_feature/widgets/duration.dart';

class OnBoardingView extends GetView<OnBoardingControllerIMP> {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      child: PageView.builder(
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChange(val);
        },
        itemCount: onBoardinglist.length,
        itemBuilder: (context, i) => Container(
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Image.asset(
                  onBoardinglist[i].image!,
                  height: height * 0.4,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.09),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60),
                    color: const Color.fromARGB(49, 139, 241, 255),
                  ),
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: [
                      Text(
                        onBoardinglist[i].title!,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 73, 73, 73)),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          onBoardinglist[i].body!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 96, 96, 96),
                              fontSize: 17),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.03),
                child: const DurationOnBoarding(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
