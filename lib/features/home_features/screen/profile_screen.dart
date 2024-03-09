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
        child: Container(
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
                          color: primaryColor,
                        ),
                        child: Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: whitecolor,
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height * 0.02),
                  child: Text(
                    "profile name",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: blackcolor),
                  ),
                ),
                Text(
                  "profile_email@gamil.com",
                  style: TextStyle(fontSize: 15, color: blackcolor),
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
                          backgroundColor: primaryColor),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: whitecolor),
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
                  icon: Icon(
                    LineAwesomeIcons.cog,
                    color: whitecolor,
                  ),
                  onTap: () {},
                  titlecolor: blackcolor,
                  backiconcolor: const Color.fromARGB(255, 7, 135, 255),
                ),
                SettingMenu(
                  endicon: true,
                  titel: "User Management",
                  icon: Icon(
                    LineAwesomeIcons.user_check,
                    color: whitecolor,
                  ),
                  onTap: () {},
                  titlecolor: blackcolor,
                  backiconcolor: const Color.fromARGB(255, 255, 164, 7),
                ),
                SettingMenu(
                  endicon: true,
                  titel: "Uploaded analysis",
                  icon: Icon(
                    LineAwesomeIcons.upload,
                    color: whitecolor,
                  ),
                  onTap: () {},
                  titlecolor: blackcolor,
                  backiconcolor: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: const Divider(),
                ),
                SettingMenu(
                  endicon: true,
                  titel: "Information",
                  icon: Icon(
                    LineAwesomeIcons.info,
                    color: whitecolor,
                  ),
                  onTap: () {},
                  titlecolor: blackcolor,
                  backiconcolor: Color.fromARGB(255, 237, 9, 199),
                ),
                SettingMenu(
                  endicon: false,
                  titel: "Logout",
                  icon: Icon(
                    LineAwesomeIcons.alternate_sign_out,
                    color: whitecolor,
                  ),
                  onTap: () {},
                  titlecolor: const Color.fromARGB(255, 246, 37, 22),
                  backiconcolor: Color.fromARGB(255, 255, 0, 0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
