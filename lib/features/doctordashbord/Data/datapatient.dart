import 'package:graduation_final_project/core/class/GET.dart';
import 'package:graduation_final_project/core/class/curd.dart';

class DashbordPatientData {
  CurdDashbord dashbord;
  DashbordPatientData(this.dashbord);

  Future getData(int ID, String doctoken) async {
    var url =
        "https://bload-test.icanforsoftware.com/api/test/info/$ID?user_id=30&api_password=AHMED\$2024";
    var token = doctoken;

    try {
      var response = await dashbord.postData(url, token);
      return response.fold((l) => l, (r) => r);
    } catch (e) {
      return Future.error("Failed to fetch data: $e");
    }
  }
}
