import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/darkmode.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/dropdown_city.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/dropdown_lang.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/profile_insettng.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/settings_list.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

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
                      borderRadius: BorderRadius.circular(300),
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
                    child: const Text(
                      "General",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const Divider(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.079),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Language",
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    DropDownLang(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.079),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "City",
                      style: TextStyle(
                          color: AppColor.blackColor,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    DropDownCity(),
                  ],
                ),
              ),
              SettingMenu(
                endicon: false,
                titel: "Logout",
                onTap: () {},
                icon: Icon(
                  LineAwesomeIcons.alternate_sign_out,
                  color: AppColor.whiteColor,
                ),
                titlecolor: AppColor.blackColor,
                backiconcolor: AppColor.primaryColor,
              ),
              SettingMenu(
                endicon: false,
                titel: "Delete Account",
                onTap: () {},
                icon: Icon(
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
                      style: TextStyle(fontSize: 13),
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
                icon: Icon(
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
                icon: Icon(
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
