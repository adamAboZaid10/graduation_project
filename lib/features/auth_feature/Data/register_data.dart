import 'package:graduation_final_project/core/class/curd.dart';

class RegisterData {
  Curd curd;
  RegisterData(this.curd);
  PostData(
      String name,
      String phone,
      String address,
      String governorate,
      String age,
      String female,
      String male,
      String email,
      String password) async {
    var response = await curd.PostData(
        "https://bload-test.icanforsoftware.com/api/client/register?api_password=AHMED\$2024&name&phone&address&governorate",
        {
          "name": name,
          "phone": phone,
          "address": address,
          "governorate": governorate,
          "age": age,
          "female": female,
          "male": male,
          "email": email,
          "password": password,
        });

    return response.fold((l) => l, (r) => r);
  }
}
