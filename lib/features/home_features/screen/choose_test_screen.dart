import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/component/screen_title.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import '../../../core/component/custom_default_button.dart';
import 'illness_screen.dart';

class ChooseTestScreen extends StatelessWidget {
  const ChooseTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const CustomScreenTitle(
          title: 'Choose Test',
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: double.infinity,
          ),
          CustomDefaultButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const IllnessScreen()));
            },
            color: AppColor.blueWhiteColor,
            text: 'First Illness',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            width: media.width - (media.width * (25 / 100)),
            radius: media.width - (media.width * (95 / 100)),
            height: media.height - (media.height * (92 / 100)),
            textColor: Colors.white,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomDefaultButton(
            onPressed: () {},
            color: AppColor.blueWhiteColor,
            text: 'Second Illness',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            width: media.width - (media.width * (25 / 100)),
            radius: media.width - (media.width * (95 / 100)),
            height: media.height - (media.height * (92 / 100)),
            textColor: Colors.white,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomDefaultButton(
            onPressed: () {},
            color: AppColor.blueWhiteColor,
            text: 'Third Illness',
            fontWeight: FontWeight.bold,
            fontSize: 28,
            width: media.width - (media.width * (25 / 100)),
            radius: media.width - (media.width * (95 / 100)),
            height: media.height - (media.height * (92 / 100)),
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
