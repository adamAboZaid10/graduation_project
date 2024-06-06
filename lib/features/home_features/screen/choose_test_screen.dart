import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/component/screen_title.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/screen/liver_screen.dart';
import 'package:lottie/lottie.dart';
import '../../../core/component/custom_default_button.dart';
import 'ckd_screen.dart';

class ChooseTestScreen extends StatelessWidget {
  const ChooseTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomScreenTitle(
          title: 'Patient Test',
        ),
      ),
      body: const CustomChooseScreenBody(),
    );
  }
}

class CustomChooseScreenBody extends StatelessWidget {
  const CustomChooseScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/lottie/analysis.json',
                width: 300.w,
                height: 200.h,
              ),
              SizedBox(
                height: 40.h,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 160.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.blueWhiteColor,
                    ),
                    child: Image.asset(
                      'assets/image/ckd_image.webp',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomDefaultButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CKDScreen()));
                      },
                      color: Colors.transparent,
                      text: 'Chronic Kidney Disease',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      width: media.width - (media.width * (25 / 100)),
                      radius: media.width - (media.width * (95 / 100)),
                      height: media.height - (media.height * (92 / 100)),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: double.infinity,
                    height: 160.h,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColor.blueWhiteColor,
                    ),
                    child: Image.asset(
                      'assets/image/liver.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CustomDefaultButton(
                      onPressed: ()
                      {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LiverScreen()));
                      },
                      color: Colors.transparent,
                      text: 'Liver disease',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      width: media.width - (media.width * (25 / 100)),
                      radius: media.width - (media.width * (95 / 100)),
                      height: media.height - (media.height * (92 / 100)),
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
