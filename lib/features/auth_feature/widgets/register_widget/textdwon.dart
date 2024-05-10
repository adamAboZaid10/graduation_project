import 'package:flutter/material.dart';
import 'package:graduation_final_project/core/constant/color.dart';

class TextDowunAuth extends StatelessWidget {
  const TextDowunAuth(
      {super.key, required this.textone, required this.texttwo, this.onTap});
  final String textone;
  final String texttwo;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(textone),
        InkWell(
          onTap: onTap,
          child: Text(texttwo,
              style: TextStyle(
                  color: AppColor.blueWhiteColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
