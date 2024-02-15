import 'package:flutter/material.dart';
import 'package:graduation_final_project/features/home_features/screen/home_page.dart';
import 'package:graduation_final_project/features/home_features/screen/profile_screen.dart';

import '../widgets/search_delegate.dart';
import '../widgets/tab_bar_view.dart';
import 'chat_screen.dart';
import 'notification_screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selected = 0;
  Widget currentWidget = const HomePage();
  Color color = Colors.red;
  List<Widget> widgets = [
    const HomePage(),
    const ChatScreen(),
    const ProfileScreen(),
    const NotificationScreen()
  ];
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: InkWell(
          onTap: () {
            showSearch(context: context, delegate: SearchData());
          },
          child: Container(
            alignment: Alignment.center,
            height: media.height - (media.height - 60),
            width: media.width - (media.width - 60),
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(30)),
            child: const Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue.withOpacity(0.3),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              tabBarView(
                  onTap: () {
                    selected == 0 ? color = Colors.red : color.blue;
                    selected = 0;
                    if (mounted) {
                      setState(() {});
                    }
                    currentWidget = const HomePage();
                    print("#####$selected");
                  },
                  isActive: selected == 0,
                  //selectedIcon: "assets/images/home_tab_select.png",
                  context: context,
                  widget: Icon(
                    Icons.home,
                    size: selected == 0 ? 45 : 35,
                    color: selected == 0 ? Colors.red : Colors.black,
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
                    color: selected == 1 ? Colors.red : Colors.black,
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
                    color: selected == 2 ? Colors.red : Colors.black,
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
                    Icons.notification_add,
                    size: selected == 3 ? 45 : 35,
                    color: selected == 3 ? Colors.red : Colors.black,
                  )),
            ],
          ),
        ),
        body: widgets.elementAt(selected));
  }
}
