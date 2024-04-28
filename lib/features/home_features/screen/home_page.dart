import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/screen/choose_test_screen.dart';

import '../../../core/component/custom_default_button.dart';
import '../widgets/carousal_slider.dart';
import '../widgets/search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    "assets/image/onboarding1.jpg",
    "assets/image/onboarding2.jpg",
    "assets/image/onboarding3.jpg",
    "assets/image/onboarding4.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
              width: media.width,
              height: media.height,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: media.width - (media.width - 20),
                    vertical: media.width - (media.width - 20)),
                child: Column(
                  children: [
                    searchDelegate(context),
                    SizedBox(
                      height: media.height - (media.height * (95 / 100)),
                    ),
                    carouselSlider(context, images),
                    SizedBox(
                      height: media.height - (media.height * (91 / 100)),
                    ),
                    CustomDefaultButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChooseTestScreen(),
                          ),
                        );
                      },
                      color: AppColor.blueWhiteColor,
                      text: 'Choose Test',
                      fontWeight: FontWeight.bold,
                      fontSize: 28.sp,
                      width: media.width - (media.width * (25 / 100)),
                      radius: media.width - (media.width * (95 / 100)),
                      height: media.height - (media.height * (92 / 100)),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
