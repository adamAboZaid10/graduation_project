import 'package:graduation_final_project/core/class/GET.dart';
import 'package:graduation_final_project/core/class/curd.dart';

class DashbordData {
  CurdDashbord dashbord;
  DashbordData(this.dashbord);
  getData(String token) async {
    var response = await dashbord.postData(
        "https://bload-test.icanforsoftware.com/api/Doctor/Dashboard?api_password=AHMED\$2024",
        token);
    return response.fold((l) => l, (r) => r);
  }
}
