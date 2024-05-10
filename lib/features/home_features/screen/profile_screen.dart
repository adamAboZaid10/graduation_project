import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/screen/edit_profile.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/settings_list.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = '';
  String email = '';
  String userId = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("id") ?? "";
    name = prefs.getString("name") ?? "";
    email = prefs.getString("email") ?? "";
    setState(() {});
  }

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
              Stack(
                children: [
                  SizedBox(
                      width: width * .3,
                      height: height * .13,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(300.r),
                        child: const Image(
                          image: AssetImage('assets/image/profile.png'),
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: width * 0.065,
                      height: height * .03,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: AppColor.primaryColor,
                      ),
                      child: const Icon(
                        LineAwesomeIcons.alternate_pencil,
                        color: AppColor.whiteColor,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 20.h,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor),
                ),
              ),
              Text(
                email,
                style: TextStyle(fontSize: 15.h, color: AppColor.blackColor),
              ),
              SizedBox(
                width: width * .4,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.025),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 14.h,
                          fontWeight: FontWeight.bold,
                          color: AppColor.whiteColor),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const Divider(),
              ),
              SettingMenu(
                titel: "Settings",
                endicon: true,
                icon: const Icon(
                  LineAwesomeIcons.cog,
                  color: AppColor.whiteColor,
                ),
                onTap: () {},
                titlecolor: AppColor.blackColor,
                backiconcolor: const Color.fromARGB(255, 7, 135, 255),
              ),
              SettingMenu(
                endicon: true,
                titel: "User Management",
                icon: const Icon(
                  LineAwesomeIcons.user_check,
                  color: AppColor.whiteColor,
                ),
                onTap: () {},
                titlecolor: AppColor.blackColor,
                backiconcolor: const Color.fromARGB(255, 255, 164, 7),
              ),
              SettingMenu(
                endicon: true,
                titel: "Uploaded analysis",
                icon: const Icon(
                  LineAwesomeIcons.upload,
                  color: AppColor.whiteColor,
                ),
                onTap: () {},
                titlecolor: AppColor.blackColor,
                backiconcolor: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                child: const Divider(),
              ),
              SettingMenu(
                endicon: true,
                titel: "Information",
                icon: const Icon(
                  LineAwesomeIcons.info,
                  color: AppColor.whiteColor,
                ),
                onTap: () {},
                titlecolor: AppColor.blackColor,
                backiconcolor: AppColor.moveColor,
              ),
              SettingMenu(
                endicon: false,
                titel: "Logout",
                icon: const Icon(
                  LineAwesomeIcons.alternate_sign_out,
                  color: AppColor.whiteColor,
                ),
                onTap: () {},
                titlecolor: AppColor.redColor,
                backiconcolor: AppColor.redColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
