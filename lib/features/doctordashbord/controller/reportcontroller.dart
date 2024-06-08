// Reportcontroller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduation_final_project/core/class/GET.dart';
import 'package:graduation_final_project/core/class/POST.dart';
import 'package:graduation_final_project/core/class/statusrequest.dart';
import 'package:graduation_final_project/core/funcation/handlingData.dart';
import 'package:graduation_final_project/features/doctordashbord/Data/reportdata.dart';

class Reportcontroller extends GetxController {
  CurdPOST curd = CurdPOST();
  ReportDataPost dashbordData = ReportDataPost(Get.put(CurdPOST()));
  List data = [];
  TextEditingController reportcontrller = TextEditingController();

  StatusRequest statusRequest = StatusRequest.none;

  @override
  void onClose() {
    reportcontrller.dispose();
    super.onClose();
  }

  Future<void> getdata(
      int docid, int testid, int userid, String report, String doctoken) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response =
        await dashbordData.getData(docid, testid, userid, report, doctoken);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response["message"] == "Report saved successfully") {
        Get.snackbar("Success", "Report saved successfully",
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.defaultDialog(title: "Warning", middleText: "Error");
      }
    } else {
      Get.defaultDialog(title: "Warning", middleText: "Failed to save report");
    }

    update();
  }
}
