import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/default_text_from_filed.dart';

class CustomEmaiEditlWidget extends StatelessWidget {
  CustomEmaiEditlWidget({super.key});
  var emaileditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomDefaultTextFormField(
          prefix: Icons.alternate_email,
          controller: emaileditController,
          type: TextInputType.emailAddress,
          validator: (value) {},
          hintText: "adam@gmail.com",
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
