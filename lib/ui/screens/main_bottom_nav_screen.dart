import 'package:flutter/material.dart';

import '../utils/app_theme_color.dart';
import '../widgets/bottom_navBar_icons.dart';
import 'home_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  int _selectIndex = 0;

  final List<Widget> _screensList = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screensList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectIndex,
        selectedItemColor: AppColor.themeColor,
        onTap: (index) {
          _selectIndex = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: _selectIndex == 0 ? NavIcons.home : NavIcons.homeOutline,
              label: 'Home'),
          BottomNavigationBarItem(
              icon: _selectIndex == 1
                  ? NavIcons.announcement
                  : NavIcons.announcementOutline,
              label: 'provider'),
          BottomNavigationBarItem(
              icon: _selectIndex == 2
                  ? NavIcons.chating
                  : NavIcons.chatingOutline,
              label: 'Chats'),
          BottomNavigationBarItem(
              icon: _selectIndex == 3
                  ? NavIcons.profile
                  : NavIcons.profileOutline,
              label: 'Profile'),
        ],
      ),
    );
  }
}
