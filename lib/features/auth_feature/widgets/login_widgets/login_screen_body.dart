import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/component/custom_default_button.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_email_widget.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_no_account_register_now.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_other_login_widget.dart';
import 'package:graduation_final_project/features/auth_feature/widgets/login_widgets/custom_password_widget.dart';

import '../../../../core/component/default_text_from_filed.dart';
import '../../screen/register_screen.dart';
class LoginScreenBody extends StatelessWidget {
   const LoginScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            SizedBox(height: 80.h,),
            Text(
                'Login',
              style:Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ) ,
            ),
            SizedBox(height: 15.h,),
            Text(
                'Welcome Back!',
              style:Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ) ,
            ),
            SizedBox(height: 40.h,),
            CustomEmailWidget(),
            SizedBox(height: 40.h,),
            CustomPasswordWidget(),
            SizedBox(height: 40.h,),
            CustomDefaultButton(
              radius: 20.r,
              width: double.infinity,
              textColor: Colors.white,
                onPressed: (){},
                color: Colors.lightBlue,
                text: 'Login'
            ),
             CustomRegisterNow(
               haveAccount: 'don\'t have account?',
               loginNow: 'Register Now',
              onTap: ()
              {
                navigateTo(context, const RegisterScreen());
              },
             ),
            SizedBox(height: 40.h,),
            const CustomOtherLoginWidget(),
          ],
        ),
      ),
    );
  }
}
