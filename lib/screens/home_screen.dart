import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'newsfeed_screen.dart';
import 'notification_screen.dart';
import 'widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: appSurface,
        elevation: 2,
        title: CustomText(
          text: const [appName, 'Notifications', 'Profile'][_selectedIndex],
          fontSize: ScreenUtil().setSp(25),
          color: appPrimary,
          fontWeight: FontWeight.w700,
        ), // CustomText
      ), // AppBar
      body: PageView(
        controller: _pageController,
        children: const [
          NewsFeedScreen(showAppBar: false),
          NotificationScreen(),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(child: Icon(Icons.person)),
                SizedBox(height: 12),
                Text('Listana'),
                Text('Tambayan member'),
              ],
            ),
          ),
        ],
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
      ), // PageView
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: _onTappedBar,

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ), // BottomNavigationBarItem
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: appPrimary,
        currentIndex: _selectedIndex,
      ), // BottomNavigationBar
    ); // Scaffold
  }

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
