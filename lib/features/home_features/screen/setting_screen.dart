import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/darkmode.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/dropdown_city.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/dropdown_lang.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/settings_list.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: height * 0.1),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.04),
                child: SizedBox(
                    width: width * .3,
                    height: height * .13,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(300.r),
                      child: const Image(
                        image: AssetImage('assets/image/profile.png'),
                      ),
                    )),
              ),
              const DarkMode(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height * 0.012),
                    child: Text(
                      "General",
                      style: TextStyle(fontSize: 13.h),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const Divider(),
              ),
              SettingMenu(
                endicon: false,
                titel: "Logout",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);
                  Get.offAndToNamed("/LoginScreen");
                },
                icon: const Icon(
                  LineAwesomeIcons.alternate_sign_out,
                  color: AppColor.whiteColor,
                ),
                titlecolor: AppColor.blackColor,
                backiconcolor: AppColor.primaryColor,
              ),
              SettingMenu(
                endicon: false,
                titel: "Delete Account",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('isLoggedIn', false);
                  Get.offAndToNamed("/LoginScreen");
                },
                icon: const Icon(
                  LineAwesomeIcons.alternate_trash,
                  color: AppColor.whiteColor,
                ),
                titlecolor: AppColor.blackColor,
                backiconcolor: AppColor.redColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: height * 0.012),
                    child: Text(
                      "Feedback",
                      style: TextStyle(fontSize: 13.h),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const Divider(),
              ),
              SettingMenu(
                endicon: false,
                titel: "Report",
                onTap: () {},
                icon: const Icon(
                  LineAwesomeIcons.bug,
                  color: AppColor.whiteColor,
                ),
                titlecolor: AppColor.blackColor,
                backiconcolor: Colors.orange,
              ),
              SettingMenu(
                endicon: false,
                titel: "Send Feedback",
                onTap: () {},
                icon: const Icon(
                  LineAwesomeIcons.thumbs_up,
                  color: AppColor.whiteColor,
                ),
                titlecolor: AppColor.blackColor,
                backiconcolor: AppColor.blueColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
