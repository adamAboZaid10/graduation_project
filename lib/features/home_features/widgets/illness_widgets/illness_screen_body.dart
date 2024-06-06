import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/features/home_features/widgets/illness_widgets/show_dialog_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/component/custom_default_button.dart';
import '../../../../core/constant/assets_data.dart';
import '../../../../core/constant/color.dart';
import '../../controller/home_controller_cubit.dart';

class IllnessScreenBody extends StatefulWidget {
  const IllnessScreenBody({super.key});

  @override
  State<IllnessScreenBody> createState() => _IllnessScreenBodyState();
}

class _IllnessScreenBodyState extends State<IllnessScreenBody> {
  String token = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString("token") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
      var cubit = HomeControllerCubit().get(context);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300.w,
              height: 300.h,
              child: cubit.selectedImage == null
                  ? Column(
                      children: [
                        Text(
                          'Please Click a button to choose the image',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20.sp,
                          ),
                        ),
                        Icon(
                          Icons.arrow_downward,
                          size: 50.sp,
                        ),
                        Image.asset(
                          AssetsData.kOnBoarding4,
                          height: 150.h,
                          width: 200.w,
                        ),
                      ],
                    )
                  : Image.file(
                      cubit.selectedImage!,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomDefaultButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => ShowDialogImage(
                        galleryOnTap: () {
                          cubit.getImageFromGallery();
                          Navigator.pop(context);
                        },
                        cameraOnTap: () {
                          cubit.getImageCamera();
                          Navigator.pop(context);
                        },
                      ));
            },
            color: AppColor.blueWhiteColor,
            text: cubit.selectedImage == null ? 'Choose Image' : 'Change Image',
            fontWeight: FontWeight.bold,
            fontSize: 28.sp,
            radius: 30.r,
            textColor: Colors.white,
          ),
          SizedBox(
            height: 15.h,
          ),
          cubit.selectedImage == null
              ? Container()
              : CustomDefaultButton(
                  onPressed: () {
                    cubit.postIllnessData(
                        imagePath: cubit.selectedImage!, token: token);
                  },
                  color: AppColor.blueWhiteColor,
                  text: 'Done',
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp,
                  radius: 30.r,
                  textColor: Colors.white,
                ),
        ],
      );
    });
  }
}
