import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation_final_project/features/home_features/screen/home_page.dart';
import 'package:graduation_final_project/features/home_features/screen/profile_screen.dart';

import '../controller/home_controller_cubit.dart';
import '../widgets/tab_bar_view.dart';
import 'chat_screen.dart';
import 'setting_screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  // final _pageController = PageController(initialPage: 0);
  // final _controller = NotchBottomBarController(index: 0);

  int selected = 0;
  Widget currentWidget = const HomePage();
  Color color = Colors.red;
  List<Widget> widgets = [
    const HomePage(),
    const ChatScreen(),
    const ProfileScreen(),
    const SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => HomeControllerCubit(),
      child: BlocBuilder<HomeControllerCubit, HomeControllerState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: BottomAppBar(
              color: Colors.grey.withOpacity(0.5),
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  tabBarView(
                      onTap: () {
                        selected = 0;
                        if (mounted) {
                          setState(() {});
                        }
                        currentWidget = const HomePage();
                      },
                      isActive: selected == 0,
                      context: context,
                      widget: Icon(
                        Icons.home,
                        size: selected == 0 ? 45 : 35,
                        color: selected == 0
                            ? Colors.blue.withOpacity(0.7)
                            : Colors.black.withOpacity(0.5),
                      )),
                  tabBarView(
                      onTap: () {
                        selected = 1;
                        if (mounted) {
                          setState(() {});
                        }
                        currentWidget = const HomePage();
                      },
                      isActive: selected == 1,
                      context: context,
                      widget: Icon(
                        Icons.chat,
                        size: selected == 1 ? 45 : 35,
                        color: selected == 1
                            ? Colors.blue.withOpacity(0.7)
                            : Colors.black.withOpacity(0.5),
                      )),
                  SizedBox(
                    width: media.width - (media.width - 10),
                  ),
                  tabBarView(
                      onTap: () {
                        selected = 2;
                        if (mounted) {
                          setState(() {});
                        }
                        currentWidget = const HomePage();
                      },
                      isActive: selected == 2,
                      context: context,
                      widget: Icon(
                        Icons.person,
                        size: selected == 2 ? 45 : 35,
                        color: selected == 2
                            ? Colors.blue.withOpacity(0.7)
                            : Colors.black.withOpacity(0.5),
                      )),
                  tabBarView(
                      onTap: () {
                        selected = 3;
                        if (mounted) {
                          setState(() {});
                        }
                        currentWidget = const HomePage();
                      },
                      isActive: selected == 3,
                      context: context,
                      widget: Icon(
                        Icons.settings,
                        size: selected == 3 ? 45 : 35,
                        color: selected == 3
                            ? Colors.blue.withOpacity(0.7)
                            : Colors.black.withOpacity(0.5),
                      )),

                ],
              ),
            ),
              body: widgets.elementAt(selected));

          // var cubit = HomeControllerCubit.get(context);
          //  _pageController.jumpToPage(cubit.index);
          // return Scaffold(
          //   bottomNavigationBar: (widgets.length <= 4)
          //       ? AnimatedNotchBottomBar(
          //           notchBottomBarController: _controller,
          //           color: Colors.white,
          //           showLabel: true,
          //           textOverflow: TextOverflow.visible,
          //           maxLine: 1,
          //           shadowElevation: 5,
          //           kBottomRadius: 28.0.r,
          //           notchColor: Colors.black,
          //           removeMargins: false,
          //           bottomBarWidth: 500,
          //           showShadow: false,
          //           durationInMilliSeconds: 300,
          //           itemLabelStyle: const TextStyle(fontSize: 10),
          //           elevation: 1,
          //           bottomBarItems: const [
          //             BottomBarItem(
          //               inActiveItem: Icon(
          //                 Icons.home_filled,
          //                 color: Colors.blueGrey,
          //               ),
          //               activeItem: Icon(
          //                 Icons.home_filled,
          //                 color: Colors.blueAccent,
          //               ),
          //               // itemLabel: '',
          //             ),
          //             BottomBarItem(
          //               inActiveItem: Icon(
          //                 Icons.chat,
          //                 color: Colors.blueGrey,
          //               ),
          //               activeItem: Icon(
          //                 Icons.chat,
          //                 color: Colors.blueAccent,
          //               ),
          //             ),
          //             BottomBarItem(
          //               inActiveItem: Icon(
          //                 Icons.person,
          //                 color: Colors.blueGrey,
          //               ),
          //               activeItem: Icon(
          //                 Icons.person,
          //                 color: Colors.yellow,
          //               ),
          //             ),
          //             BottomBarItem(
          //               inActiveItem: Icon(
          //                 Icons.settings,
          //                 color: Colors.blueGrey,
          //               ),
          //               activeItem: Icon(
          //                 Icons.settings,
          //                 color: Colors.pink,
          //               ),
          //             ),
          //           ],
          //           onTap: (index) {
          //             print('current selected index $index');
          //             cubit.bottomNavBar(index);
          //           },
          //           kIconSize: 20.sp,
          //         )
          //       : null,


            // body:widgets.elementAt(cubit.index),
        },
      ),
    );
  }
}
