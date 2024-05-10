import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/handlingdataview.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/core/funcation/valedthion.dart';
import 'package:graduation_final_project/features/auth_feature/controller/login_controller.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/bodyauth.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/bouttonauth.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/textdwon.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/textform.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/titleauth.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(185, 91, 175, 200),
          title: const Text(
            "Sign In ",
            style: TextStyle(
                fontSize: 25, color: Color.fromARGB(255, 231, 231, 231)),
          ),
        ),
        body: GetBuilder<LoginControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest!,
                  widget: Container(
                    child: Form(
                      key: controller.loginkey,
                      child: ListView(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 230,
                          padding: EdgeInsets.only(
                              top: 23.h, left: 35.h, right: 35.h),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(100)),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(185, 91, 175, 200),
                                  AppColor.blueWhiteColor,
                                ]),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              const TitleAuth(title: "Welcome Back"),
                              SizedBox(
                                height: 10.h,
                              ),
                              const BodyAuth(
                                  body:
                                      "Sign In With Your Email And Password\n OR Continue With Social Media"),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        TextForm(
                          mycontroller: controller.emailController,
                          isNum: false,
                          valed: (val) {
                            return validInput(val!, 7, 50, "email");
                          },
                          hintText: "Enter Your Email",
                          label: "Email",
                          suffixIcon: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        GetBuilder<LoginControllerImp>(
                          builder: (controller) => TextForm(
                            onTap: () {
                              controller.changedisplaypasswoed();
                            },
                            obscureText: controller.display,
                            mycontroller: controller.passwordController,
                            isNum: false,
                            valed: (val) {
                              return validInput(val!, 6, 30, "password");
                            },
                            hintText: "Enter Your Password",
                            label: "Password",
                            suffixIcon: Icons.lock_outline,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "Forget Password",
                              style: TextStyle(color: AppColor.secondColor),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        ButtonAuth(
                            onPressed: () {
                              controller.login();
                            },
                            child: "Sign In"),
                        TextDowunAuth(
                          textone: "Don't have an account ? ",
                          texttwo: "Sign Up",
                          onTap: () {
                            controller.gotopage();
                          },
                        )
                      ]),
                    ),
                  ),
                )));
  }
}
