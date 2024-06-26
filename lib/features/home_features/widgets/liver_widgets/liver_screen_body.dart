import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/features/home_features/widgets/ckd_widgets/show_dialog_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/component/custom_default_button.dart';
import '../../../../core/constant/color.dart';
import '../../controller/home_controller_cubit.dart';
import '../../screen/liver_doctor.dart';

class LiverBody extends StatefulWidget {
  const LiverBody({super.key});

  @override
  State<LiverBody> createState() => _LiverBodyState();
}

class _LiverBodyState extends State<LiverBody> {
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
                            'Please Enter Liver Disease Test: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Image.asset(
                            'assets/image/liver.png',
                            height: 200.h,
                            // fit: BoxFit.cover,
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
              height: 20.h,
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
                        ? 'Choose Liver Test'
                        : 'Change Liver Test',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    radius: 35.r,
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
                          Row(
                            children: [
                              Text(
                                'There are Group of Liver Doctors',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15.sp),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const LiverDoctors(),
                                    ),
                                  );
                                },
                                child: Text(
                                  'Tap Here',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15.sp,
                                      color: AppColor.blueWhiteColor),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
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
                            text: 'Choose Another Liver Test',
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            radius: 5.r,
                            textColor: Colors.white,
                          ),
                        ],
                      )
                    : CustomDefaultButton(
                        onPressed: () {
                          cubit.postIllnessData(
                            imagePath: cubit.selectedImage!,
                            token: token,
                          );
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
      },
    );
  }
}
