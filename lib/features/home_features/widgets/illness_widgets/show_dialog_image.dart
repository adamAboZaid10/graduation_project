import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/component/custom_default_button.dart';

class ShowDialogImage extends StatelessWidget {
  const ShowDialogImage({
    super.key,
    required this.galleryOnTap,
    required this.cameraOnTap,
  });

  final void Function() galleryOnTap;
  final void Function() cameraOnTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              const Text(
                'Please choose an option',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 5.h,
              ),
              Divider(
                thickness: 1.sp,
              ),
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: CustomDefaultButton(
                  onPressed: galleryOnTap,
                  color: Colors.black38,
                  text: 'Gallery',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  radius: 30.r,
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: CustomDefaultButton(
                  onPressed: cameraOnTap,
                  color: Colors.black38,
                  text: 'Camera',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                  radius: 30.r,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
