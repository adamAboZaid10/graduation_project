import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/handlingdataview.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/doctordashbord/CircularPercentIndicator.dart';
import 'package:graduation_final_project/features/doctordashbord/controller/controllel.dart';
import 'package:graduation_final_project/features/doctordashbord/model/dashbordmodel.dart';
import 'package:graduation_final_project/features/doctordashbord/widgit/list_patients_of_tests.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DoctorDashbord extends StatefulWidget {
  const DoctorDashbord({Key? key}) : super(key: key);

  @override
  State<DoctorDashbord> createState() => _DoctorDashbordState();
}

class _DoctorDashbordState extends State<DoctorDashbord> {
  final DashbordController controller = Get.put(DashbordController());

  String name = '';
  String email = '';
  String userId = '';
  String token = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString("id") ?? "";
    name = prefs.getString("name") ?? "";
    email = prefs.getString("email") ?? "";
    token = prefs.getString("token") ?? "";
    setState(() {});

    controller.getdata(token);
    print("++++++++++++++");
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<DashbordController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest!,
          widget: Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.h),
                      child: Text(
                        controller.data.isNotEmpty
                            ? "Hi, ${controller.data[0]["name"]}"
                            : "Hi",
                        style: TextStyle(
                          fontSize: 28.sp,
                          color: AppColor.blueWhiteColor,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications,
                        size: 30.h,
                        color: AppColor.blueWhiteColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.h),
                  child: Text(
                    "Let's Find Patient",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                DoctorCircular(
                  presentPatients: controller.patientsList.length,
                  readTests: controller.patientsList.fold<int>(
                      0,
                      (previousValue, element) =>
                          previousValue + (element.cKDTestNumber ?? 0)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: controller.patientsList.map((patient) {
                        return list_patients_of_tests(patient: patient);
                      }).toList(),
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
