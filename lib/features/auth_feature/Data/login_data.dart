import 'package:graduation_final_project/core/class/curd.dart';

class LoginData {
  Curd curd;
  LoginData(this.curd);
  PostData(
    String email,
    String password,
  ) async {
    var response = await curd.PostData(
        "https://bload-test.icanforsoftware.com/api/login?api_password=AHMED\$2024&username&password",
        {
          "username": email,
          "password": password,
        });

    return response.fold((l) => l, (r) => r);
  }
}
