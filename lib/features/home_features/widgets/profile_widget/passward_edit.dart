import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/default_text_from_filed.dart';

class CustomPasswordEditWidget extends StatelessWidget {
  CustomPasswordEditWidget({super.key});
  var passwordeditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomDefaultTextFormField(
          maxLine: 1,
          prefix: Icons.lock,
          controller: passwordeditController,
          type: TextInputType.visiblePassword,
          validator: (value) {
            if (value!.isEmpty) {
              return 'value must not be empty';
            }
            return null;
          },
          hintText: "password",
          obscure: false,
          backgroundColor: Colors.white,
          hintColor: Colors.black,
          textColor: Colors.black,
          radius: 15.w,
        ),
      ],
    );
  }
}
