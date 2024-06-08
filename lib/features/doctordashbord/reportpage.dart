// Reportpage.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/handlingdataview.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/doctordashbord/controller/reportcontroller.dart';
import 'package:graduation_final_project/features/doctordashbord/model/doctormodel.dart';
import 'package:graduation_final_project/features/doctordashbord/model/gettastdata.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Reportpage extends StatefulWidget {
  const Reportpage({Key? key}) : super(key: key);

  @override
  State<Reportpage> createState() => _ReportpageState();
}

class _ReportpageState extends State<Reportpage> {
  final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
  late final GetpatientModel getpatientModel;
  late final DoctorModel doctorModel;
  final Reportcontroller controller = Get.put(Reportcontroller());
  String name = '';
  String email = '';
  String userId = '';
  String token = '';

  @override
  void initState() {
    super.initState();
    getpatientModel = arguments['getpatientModel'] as GetpatientModel;
    doctorModel = arguments['doctorModel'] as DoctorModel;
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("id") ?? "";
    name = prefs.getString("name") ?? "";
    email = prefs.getString("email") ?? "";
    token = prefs.getString("token") ?? "";
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getpatientModel.analysisType.toString()),
      ),
      body: SingleChildScrollView(
        child: GetBuilder<Reportcontroller>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                if (getpatientModel.analysisTest != null)
                  CachedNetworkImage(
                    imageUrl:
                        'https://bload-test.icanforsoftware.com/${getpatientModel.analysisTest}',
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) {
                      print('Error loading image: $error');
                      return Column(
                        children: [
                          Icon(Icons.error, color: Colors.red, size: 100.h),
                          Text(
                            'Error loading image',
                            style:
                                TextStyle(color: Colors.red, fontSize: 18.sp),
                          ),
                        ],
                      );
                    },
                  ),
                Container(
                  margin: EdgeInsets.only(left: 20.h, right: 20.h, top: 30.h),
                  child: TextFormField(
                    controller: controller.reportcontrller,
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Report.....",
                      hintStyle: TextStyle(
                          fontSize: 14.h, color: AppColor.secondColor),
                      labelStyle: TextStyle(
                          fontSize: 20.h, color: AppColor.blueWhiteColor),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 30.h, vertical: 17.h),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(40.r),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(185, 91, 175, 200),
                        AppColor.blueWhiteColor,
                      ],
                    ),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      controller.getdata(
                          doctorModel.id!,
                          getpatientModel.id!,
                          getpatientModel.userId!,
                          controller.reportcontrller.text,
                          token);
                    },
                    child: Text(
                      "Send Report",
                      style: TextStyle(fontSize: 18.h, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
