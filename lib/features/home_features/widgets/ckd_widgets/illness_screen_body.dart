import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/features/home_features/widgets/ckd_widgets/show_dialog_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/component/custom_default_button.dart';
import '../../../../core/constant/color.dart';
import '../../controller/home_controller_cubit.dart';

class CKDBody extends StatefulWidget {
  const CKDBody({super.key});

  @override
  State<CKDBody> createState() => _CKDBodyState();
}

class _CKDBodyState extends State<CKDBody> {
  String? token;
  @override
  void initState() {
    super.initState();
    setState(() {
      loadData();
    });
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token") ?? "";
    });
    print("@@@@@@@@@@@@@@@@@@@ $token");
  }

  Widget build(BuildContext context) {
    return BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
      var cubit = HomeControllerCubit.get(context);
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 300.w,
              child: cubit.selectedImage == null
                  ? Column(
                      children: [
                        Text(
                          'Please Enter Chronic Kidney Disease Test: ',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          'assets/image/ckd_image.webp',
                          height: 300.h,
                          width: double.infinity,
                        ),
                      ],
                    )
                  : Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.r,
                        ),
                      ),
                      child: Image.file(
                        cubit.selectedImage!,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          state is UploadImageSuccessState
              ? Container()
              : CustomDefaultButton(
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
                  text: cubit.selectedImage == null
                      ? 'Choose CKD Test'
                      : 'Change CKD Test',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                  radius: 5.r,
                  textColor: Colors.white,
                ),
          SizedBox(
            height: 15.h,
          ),
          cubit.selectedImage == null
              ? Container()
              : state is UploadImageSuccessState
                  ? Column(
                      children: [
                        Text(
                          'Your Result: ${cubit.result}',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
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
                          text: 'Choose Another CKD Test',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          radius: 5.r,
                          textColor: Colors.white,
                        ),
                      ],
                    )
                  : CustomDefaultButton(
                      onPressed: () {
                        setState(() {
                          cubit.postIllnessData(
                            imagePath: cubit.selectedImage!,
                            token: token,
                          );
                        });
                        print("############# $token #################");
                      },
                      color: AppColor.blueWhiteColor,
                      text: 'Show Result',
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      radius: 5.r,
                      textColor: Colors.white,
                    ),
        ],
      );
    });
  }
}
