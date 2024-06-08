import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/default_text_from_filed.dart';

class CustomNameWidget extends StatelessWidget {
  CustomNameWidget({super.key});
  var nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        SizedBox(
          height: 10.h,
        ),
        CustomDefaultTextFormField(
          controller: nameController,
          type: TextInputType.emailAddress,
          validator: (value) {
            if (value!.isEmpty) {
              return 'name must not be empty';
            }
          },
          hintText: "adam mo",
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
