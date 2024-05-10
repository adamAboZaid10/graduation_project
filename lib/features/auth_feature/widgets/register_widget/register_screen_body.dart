import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/handlingdataview.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/core/funcation/valedthion.dart';
import 'package:graduation_final_project/features/auth_feature/controller/register_controller.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/bodyauth.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/bouttonauth.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/cheackbox.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/dropdwan.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/textdwon.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/textform.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/titleauth.dart';

class RegisterScreenBody extends StatefulWidget {
  const RegisterScreenBody({super.key});

  @override
  State<RegisterScreenBody> createState() => _RegisterScreenBodyState();
}

class _RegisterScreenBodyState extends State<RegisterScreenBody> {
  @override
  Widget build(BuildContext context) {
    Get.put(Rigister_controller());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(185, 91, 175, 200),
          title: Text(
            "Sign Up ",
            style: TextStyle(
                fontSize: 25.h, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
        body: GetBuilder<Rigister_controller>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller!.statusRequest!,
                  widget: Container(
                    child: Form(
                      key: controller.signupkey,
                      child: ListView(children: [
                        Container(
                          alignment: Alignment.center,
                          height: 150.h,
                          padding: EdgeInsets.only(
                              top: 10.h, left: 35.h, right: 35.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(80.r)),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(185, 91, 175, 200),
                                  AppColor.blueWhiteColor,
                                ]),
                          ),
                          child: Column(
                            children: [
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
                        TextForm(
                          mycontroller: controller.nameController,
                          isNum: false,
                          valed: (val) {
                            return validInput(val!, 5, 20, "Name");
                          },
                          hintText: "Enter Your UserName",
                          label: "UserName",
                          suffixIcon: Icons.person_outlined,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextForm(
                          mycontroller: controller.phoneController,
                          isNum: true,
                          valed: (val) {
                            return validInput(val!, 10, 12, "phone");
                          },
                          hintText: "Enter Your Phone",
                          label: "Phone",
                          suffixIcon: Icons.phone_android_outlined,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextForm(
                          mycontroller: controller.addressController,
                          isNum: false,
                          valed: (val) {
                            return validInput(val!, 5, 16, "Address");
                          },
                          hintText: "Enter Your address",
                          label: "Address",
                          suffixIcon: Icons.location_on_outlined,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        CustomDropdown(
                          hintText: 'governorate',
                          items: controller.governorates,
                          label: 'Governorate',
                          onChanged: (String? newValue) {
                            setState(() {
                              if (newValue != null) {
                                controller.selectedGovernorate = newValue;
                              }
                            });
                          },
                          value: controller.selectedGovernorate,
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextForm(
                          mycontroller: controller.ageController,
                          isNum: true,
                          valed: (val) {
                            return validInput(val!, 1, 3, "Age");
                          },
                          hintText: "Enter Your Age",
                          label: "Age",
                          suffixIcon: Icons.cake,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomCheckbox(
                              label: 'Male',
                              value: controller.maleSelected,
                              onChanged: (newValue) {
                                setState(() {
                                  controller.maleSelected = newValue!;
                                  if (controller.maleSelected) {
                                    controller.femaleSelected = false;
                                  }
                                });
                              },
                            ),
                            CustomCheckbox(
                              label: 'Female',
                              value: controller.femaleSelected,
                              onChanged: (newValue) {
                                setState(() {
                                  controller.femaleSelected = newValue!;
                                  if (controller.femaleSelected) {
                                    controller.maleSelected = false;
                                  }
                                });
                              },
                            ),
                          ],
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
                          height: 5.h,
                        ),
                        GetBuilder<Rigister_controller>(
                          builder: (controller) => TextForm(
                            onTap: () {
                              controller.changedisplaypasswoed();
                            },
                            mycontroller: controller.passwordController,
                            obscureText: controller.display,
                            isNum: false,
                            valed: (val) {
                              return validInput(val!, 6, 30, "password");
                            },
                            hintText: "Enter Your Password",
                            label: "Password",
                            suffixIcon: Icons.lock_outline,
                          ),
                        ),
                        ButtonAuth(
                            onPressed: () {
                              controller.register();
                            },
                            child: "Sign In"),
                        TextDowunAuth(
                          textone: " have an account ?  ",
                          texttwo: "Login In",
                          onTap: () {},
                        )
                      ]),
                    ),
                  ),
                )));
  }
}
