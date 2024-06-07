import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PatientHistory extends StatelessWidget {
  const PatientHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient History"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: ListView.separated(
          itemBuilder: (context, index) => const CustomItemOfHistory(
            typeOfAnalysis: 'type of analysis',
            result: 'result',
            date: '12/12/2022',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqhev_LZtgfsrWs1ZgxhI1_Nv79WvFc5yH3g&s',
          ),
          separatorBuilder:(context, index)=> Padding(

            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          itemCount: 10,
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
        CachedNetworkImage(
          imageUrl: imageUrl,
          width: double.infinity,
          height: 300.h,
          fit: BoxFit.cover,
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          'Result : $result',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15.sp,
          ),
        ),
      ],
    );
  }
}
