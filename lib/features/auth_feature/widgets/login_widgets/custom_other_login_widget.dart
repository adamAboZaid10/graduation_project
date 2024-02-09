import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constant/assets_data.dart';

class CustomOtherLoginWidget extends StatelessWidget {
  const CustomOtherLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Image.asset(AssetsData.kFacebookIcon,width: 40.w,height: 40.h,),
        ),
         SizedBox(
          width: 30.w,
        ),
        InkWell(
          onTap: () {},
          child: SvgPicture.asset(AssetsData.kGoogleIcon,width: 40.w,height: 40.h,),
        ),
      ],
    );
  }
}
