import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/constant/approutes.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/screen/edit_profile.dart';
import 'package:graduation_final_project/features/home_features/widgets/settings_widget/settings_list.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashbordProfilePage extends StatefulWidget {
  const DashbordProfilePage({super.key});

  @override
  State<DashbordProfilePage> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<DashbordProfilePage> {
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.1, horizontal: width * 0.001),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    SizedBox(
                        width: width * .4,
                        height: height * .2,
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
                          color: AppColor.blueWhiteColor,
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
                          MaterialPageRoute(
                              builder: (context) => EditProfile()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.blueWhiteColor),
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
                  endicon: false,
                  titel: "Logout",
                  icon: const Icon(
                    LineAwesomeIcons.alternate_sign_out,
                    color: AppColor.whiteColor,
                  ),
                  onTap: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('isLoggedIndashbord', false);
                    Get.offAndToNamed("/LoginScreen");
                  },
                  titlecolor: AppColor.redColor,
                  backiconcolor: AppColor.redColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
