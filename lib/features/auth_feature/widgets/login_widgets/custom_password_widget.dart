
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/features/auth_feature/controller/auth_cubit.dart';

import '../../../../core/component/default_text_from_filed.dart';

class CustomPasswordWidget extends StatelessWidget {
   CustomPasswordWidget({super.key});
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit,AuthState>(
      builder: (context,state) {
        var cubit = AuthCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Text(
              'Password',
              style:Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ) ,
            ),
            SizedBox(height: 10.h,),
            CustomDefaultTextFormField(
              suffixPressed: ()
              {
                cubit.changePasswordVisibility();
              },
              suffix: cubit.suffix,
              maxLine: 1,
              prefix: Icons.lock,
              controller: passwordController,
              type: TextInputType.visiblePassword,
              validator: (value){
                if(value!.isEmpty)
                {
                  return 'value must not be empty';
                }
                return null;

              },
              hintText: "password",
              obscure: cubit.obscureText,
              backgroundColor: Colors.white,
              hintColor: Colors.black,
              textColor: Colors.black,
              radius: 15.w,
            ),
          ],
        );
      }
    );
  }
}
