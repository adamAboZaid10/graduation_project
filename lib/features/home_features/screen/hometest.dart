import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/core/constant/color.dart';
import 'package:graduation_final_project/features/home_features/screen/chat_screen.dart';
import 'package:graduation_final_project/features/home_features/screen/ckd_screen.dart';
import 'package:graduation_final_project/features/home_features/screen/liver_screen.dart';
import 'package:graduation_final_project/features/home_features/screen/profile_screen.dart';
import 'package:graduation_final_project/features/home_features/screen/setting_screen.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({Key? key}) : super(key: key);

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(),
      const ChatScreen(),
      const ProfileScreen(),
      const SettingsScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        currentIndex: index,
        selectedItemColor:
            AppColor.blueWhiteColor, // Make sure AppColor is defined
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
      ),
      body: screens[index],
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Text(
                  'Hi,',
                  style: TextStyle(
                      color: AppColor.blueWhiteColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5.h),
                child: Text(
                  ' Let\'s Find Your Doctor',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColor.blueWhiteColor,
                  ),
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20.h),
              Text('Tests',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryCard(
                      imag: "assets/image/kidney.png",
                      label: 'CKD Test',
                      color: const Color.fromARGB(255, 31, 188, 39),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CKDScreen()));
                      }),
                  CategoryCard(
                      imag: "assets/image/liver.png",
                      label: 'Liver Test',
                      color: Colors.purple,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LiverScreen()));
                      }),
                ],
              ),
              SizedBox(height: 20.h),
              Text('Info about tests',
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),
              InfoAboutTests(
                imag: "assets/image/kidney.png",
                nametast: 'Chronic Kidney Disease Tests ',
                samary: 'CKD',
                info:
                    "Chronic kidney disease (CKD) tests are used to diagnose and monitor kidney function. These tests include measuring levels of creatinine, blood urea nitrogen (BUN), and glomerular filtration rate (GFR). Early detection and treatment can help prevent the progression of CKD.",
              ),
              InfoAboutTests(
                imag: 'assets/image/liver.png',
                nametast: 'Liver function tests',
                samary: 'LF',
                info:
                    "Liver function tests (LFTs) are a group of blood tests that provide information about the state of a patient\'s liver. These tests include the alanine transaminase (ALT) test, aspartate transaminase (AST) test, alkaline phosphatase (ALP) test, and bilirubin test. LFTs help diagnose liver diseases such as hepatitis, cirrhosis, and liver cancer.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String imag;
  final String label;
  final Color color;
  final VoidCallback onTap;

  CategoryCard(
      {required this.imag,
      required this.label,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            radius: 45.r,
            backgroundColor: color.withOpacity(0.2),
            child: Image.asset(
              imag,
              height: 55.h,
            ),
          ),
          SizedBox(height: 5.h),
          Text(label,
              style: TextStyle(
                  color: color, fontSize: 16.h, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class InfoAboutTests extends StatelessWidget {
  final String imag;
  final String nametast;
  final String samary;
  final String info;

  InfoAboutTests({
    required this.imag,
    required this.nametast,
    required this.samary,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(nametast),
              content: Text(info),
              actions: [
                TextButton(
                  child: Text(
                    'Close',
                    style: TextStyle(color: AppColor.blueWhiteColor),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: ListTile(
          leading: Image.asset(
            imag,
            height: 40.h,
          ),
          title: Text(nametast),
          subtitle: Text(samary),
        ),
      ),
    );
  }
}
