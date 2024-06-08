import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/features/home_features/controller/home_controller_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientHistory extends StatefulWidget {
  const PatientHistory({super.key});

  @override
  State<PatientHistory> createState() => _PatientHistoryState();
}

class _PatientHistoryState extends State<PatientHistory> {
  String token = '';

  @override
  void initState() {
    super.initState();
    setState(() {
      loadData();
    });
  }

  // HomeControllerCubit controllerCubit = HomeControllerCubit();
  void loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      token = prefs.getString("token") ?? "";
    });
    print("@@@@@@@@@@@@@@@@@@@ $token");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeControllerCubit()
        ..patientData(
            token:
                "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvYXBpL2xvZ2luIiwiaWF0IjoxNzE3ODQ2OTg4LCJleHAiOjE3MTc4NTA1ODgsIm5iZiI6MTcxNzg0Njk4OCwianRpIjoiMW15OGRZRlpOME80TUFXayIsInN1YiI6IjMwIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.81Kb2wuSQdZCZUnm7PtHWZupbr-vtYWgyuPvoVvMHUI"),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Patient History"),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: BlocBuilder<HomeControllerCubit, HomeControllerState>(
          builder: (context, state) {
            var cubit = HomeControllerCubit.get(context);
            if (state is PatientDataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PatientDataSuccessState) {
              return Padding(
                padding: EdgeInsets.all(16.0.sp),
                child: ListView.separated(
                  itemBuilder: (context, index) => CustomItemOfHistory(
                    typeOfAnalysis: cubit.patient[index].testType.toString(),
                    result: cubit.patient[index].testResult.toString(),
                    date: cubit.patient[index].date.toString(),
                    imageUrl: cubit.patient[index].analysisTest.toString(),
                  ),
                  separatorBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  itemCount: cubit.patient.length,
                ),
              );
            } /* else if (state is PatientDataFailedState) {
              return Center(
                child: Container(
                    child: Image.network(
                        'https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061132_640.png')),
              );
            }*/
            return Center(
              child: Container(
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061132_640.png')),
            );
          },
        ),
      ),
    );
  }
}

class CustomItemOfHistory extends StatelessWidget {
  const CustomItemOfHistory({
    super.key,
    required this.typeOfAnalysis,
    required this.result,
    required this.date,
    required this.imageUrl,
  });

  final String typeOfAnalysis;
  final String result;
  final String date;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                typeOfAnalysis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              ),
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        /*CachedNetworkImage(
          imageUrl: imageUrl,
          width: double.infinity,
          height: 300.h,
          fit: BoxFit.cover,
        ),*/
        Image(
          image: NetworkImage(imageUrl),
          width: double.infinity,
          height: 300.h,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result : $result',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15.sp,
              ),
            ),
          ],
        )
      ],
    );
  }
}
