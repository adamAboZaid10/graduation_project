import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:graduation_final_project/core/class/handlingdataview.dart';
import 'package:graduation_final_project/features/doctordashbord/controller/getpatentdatacontroller.dart';
import 'package:graduation_final_project/features/doctordashbord/model/dashbordmodel.dart';
import 'package:graduation_final_project/features/doctordashbord/widgit/list_get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import PatientModel

class Display extends StatefulWidget {
  const Display({super.key});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  final patientModel patient = Get.arguments as patientModel;
  GetPatentdataController controller = Get.put(GetPatentdataController());
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

    controller.getdata(patient.id!, token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(patient.patientName.toString()),
      ),
      body: SingleChildScrollView(
          child: GetBuilder<GetPatentdataController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest!,
                    widget: Column(
                      children: [
                        Column(
                          children: controller.data.map((getpatientModel) {
                            return ListGrtTests(
                              getpatientModel: getpatientModel!,
                              doctorModel: controller
                                  .doctorData.value, // Ensure this is passed
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
