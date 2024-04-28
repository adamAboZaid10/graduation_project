import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/component/custom_default_button.dart';
import 'package:graduation_final_project/core/component/default_text_from_filed.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/auth_feature/screen/login_screen.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_email_widget.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_no_account_register_now.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_other_login_widget.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_password_widget.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/register_widget/custom_name_widget.dart';

class RegisterScreenBody extends StatelessWidget {
   RegisterScreenBody({super.key});
   var emailController = TextEditingController();
   var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.sp),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80.h,

              ),
              Text(
                'Register',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                'Welcome ',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(
                height: 40.h,
              ),
              CustomNameWidget(),
              SizedBox(
                height: 40.h,
              ),
              CustomEmailWidget(emailController: emailController,),
              SizedBox(
                height: 40.h,
              ),
              CustomPasswordWidget(),
              SizedBox(
                height: 40.h,
              ),
              CustomDefaultButton(
                radius: 20.r,
                width: double.infinity,
                textColor: Colors.white,
                onPressed: ()
                {
                  if(formKey.currentState!.validate()){

                  }
                },
                color: AppColor.blueWhiteColor,
                text: 'Register',
              ),
              CustomRegisterNow(
                haveAccount: 'have account ?',
                loginNow: 'Login Now',
                onTap: () {
                  navigateTo(context, const LoginScreen());
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              const CustomOtherLoginWidget(),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
