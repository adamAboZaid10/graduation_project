import 'package:graduation_final_project/core/class/POST.dart';

class ReportDataPost {
  CurdPOST curdPOST;
  ReportDataPost(this.curdPOST);

  Future getData(
      int docID, int tastID, int userID, String report, String doctoken) async {
    var url =
        "https://bload-test.icanforsoftware.com/api/send/report?api_password=AHMED\$2024&docid=$docID&testid=$tastID&patientid=$userID&report=$report";
    var token = doctoken;

    try {
      var response = await curdPOST.postData(url, token);
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      return Future.error("Failed to fetch data: $e");
    }
  }
}
