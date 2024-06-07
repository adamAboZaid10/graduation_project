import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget carouselSlider(BuildContext context, List images) {
  Size media = MediaQuery.of(context).size;
  return CarouselSlider(
    options: CarouselOptions(
      height: media.height / 2,
      viewportFraction: 0.8,
      initialPage: 0,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeFactor: 0.3,
      autoPlayInterval: const Duration(seconds: 2),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
    ),
    items: images.map((e) {
      return PageView.builder(
        itemCount: images.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: media.width * 0.08, vertical: media.width * 0.08),
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: media.width * 0.03),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey.shade400 ),
            child: Image.asset(
              e,
              fit: BoxFit.cover,
              width: double.infinity,
              height:200.h,
            ),
          );
        },
      );
    }).toList(),
  );
}
