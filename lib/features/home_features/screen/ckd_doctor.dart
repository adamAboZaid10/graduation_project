import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CkdDoctors extends StatelessWidget {
  const CkdDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ckd Doctors'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: doctorsList.length,
                itemBuilder: (context, index) {
                  return CustomDoctorsItem(
                    name: doctorsList[index].name,
                    speciality: doctorsList[index].speciality,
                    location: doctorsList[index].location,
                    phone: doctorsList[index].phone,
                    imgUrl: doctorsList[index].imgUrl,
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  height: 20.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDoctorsItem extends StatelessWidget {
  const CustomDoctorsItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.speciality,
    required this.location,
    required this.phone,
  });

  final String imgUrl;
  final String name;
  final String speciality;
  final String location;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: CachedNetworkImage(
            imageUrl: imgUrl,
            width: 80.w,
            height: 80.h,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Dr. $name',
                style: TextStyle(
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  Text(
                    'Speciality : $speciality',
                    style: TextStyle(
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Text(
                      'Location : $location',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Phone : $phone',
                style: TextStyle(
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class doctors {
  String name;
  String speciality;
  String location;
  String phone;
  String imgUrl;

  doctors({
    required this.name,
    required this.speciality,
    required this.location,
    required this.phone,
    required this.imgUrl,
  });
}

List<doctors> doctorsList = [
  doctors(
    name: 'Ahmed Asser',
    speciality: 'Ckd',
    location: 'Baltim',
    phone: '01227987184',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'Sarah Smith',
    speciality: 'Ckd',
    location: 'Cairo',
    phone: '01234567890',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040901_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'John Doe',
    speciality: 'Ckd',
    location: 'Alexandria',
    phone: '01298765432',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040902_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'Emily Davis',
    speciality: 'Ckd',
    location: 'Giza',
    phone: '01211111111',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040903_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'Jessica Wilson',
    speciality: 'Ckd',
    location: 'Aswan',
    phone: '01233333333',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040905_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'Ahmed Asser',
    speciality: 'Ckd',
    location: 'Baltim',
    phone: '01227987184',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040900_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'David Clark',
    speciality: 'Ckd',
    location: 'Mansoura',
    phone: '01244444444',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040906_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'Laura Lee',
    speciality: 'Ckd',
    location: 'Suez',
    phone: '01255555555',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040907_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
  doctors(
    name: 'Chris Martin',
    speciality: 'Ckd',
    location: 'Port Said',
    phone: '01266666666',
    imgUrl:
        'https://t4.ftcdn.net/jpg/02/60/04/09/360_F_260040908_oO6YW1sHTnKxby4GcjCvtypUCWjnQRg5.jpg',
  ),
];
