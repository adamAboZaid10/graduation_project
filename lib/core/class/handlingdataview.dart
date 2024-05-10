import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/class/statusrequest.dart';
import 'package:graduation_final_project/core/constant/assets_data.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AssetsData.loding))
        : statusRequest == StatusRequest.offlinefailure
            ? Center(child: Lottie.asset(AssetsData.offline, fit: BoxFit.fill))
            : statusRequest == StatusRequest.serverfailure
                ? Center(child: Lottie.asset(AssetsData.offline))
                : statusRequest == StatusRequest.failure
                    ? Center(child: Lottie.asset(AssetsData.loding))
                    : widget;
  }
}

class AppImageAsset {}
