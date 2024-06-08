import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:graduation_final_project/core/class/statusrequest.dart';
import 'package:graduation_final_project/core/funcation/chickinternet.dart';
import 'package:http/http.dart' as http;

class CurdDashbord {
  Future<Either<StatusRequest, Map>> postData(
      String linkurl, String token) async {
    try {
      if (await ChickInternet()) {
        var response = await http.get(Uri.parse(linkurl), headers: {
          'Authorization': 'Bearer $token',
        });
        if (response.statusCode == 200 ||
            response.statusCode == 201 ||
            response.statusCode == 400 ||
            response.statusCode == 401) {
          Map responsebody = jsonDecode(response.body);
          print(response.statusCode);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (_) {
      return const Left(StatusRequest.serverfailure);
    }
  }
}
