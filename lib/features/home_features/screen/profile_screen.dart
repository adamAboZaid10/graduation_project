import 'package:flutter/material.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/screen/edit_profile.dart';
import 'package:graduation_final_project/features/home_features/widgets/profile_widget/profile_mun.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/settings_list.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                        borderRadius: BorderRadius.circular(300),
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
                        borderRadius: BorderRadius.circular(100),
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
                child: const Text(
                  "profile name",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.blackColor),
                ),
              ),
              const Text(
                "profile_email@gamil.com",
                style: TextStyle(fontSize: 15, color: AppColor.blackColor),
              ),
              SizedBox(
                width: width * .4,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.025),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => EditProfile()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor),
                    child: const Text(
                      "Edit Profile",
                      style: TextStyle(
                          fontSize: 17,
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
                backiconcolor:AppColor.redColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
