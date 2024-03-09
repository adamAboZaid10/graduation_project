import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/component/custom_default_button.dart';
import 'package:graduation_final_project/core/component/screen_title.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/widgets/profile_widget/email_edit.dart';
import 'package:graduation_final_project/features/home_features/widgets/profile_widget/passward_edit.dart';
import 'package:graduation_final_project/features/home_features/widgets/profile_widget/profile_name_edit.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const CustomScreenTitle(
          title: 'Edit Profile',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * .08, vertical: height * .06),
          child: Container(
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
                        LineAwesomeIcons.camera,
                        color: whitecolor,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              CustomNameEditWidget(),
              SizedBox(
                height: 40.h,
              ),
              CustomEmaiEditlWidget(),
              SizedBox(
                height: 40.h,
              ),
              CustomPasswordEditWidget(),
              SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .08),
                child: CustomDefaultButton(
                    radius: 20.r,
                    width: double.infinity,
                    textColor: Colors.white,
                    onPressed: () {},
                    color: primaryColor,
                    text: 'Login'),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
