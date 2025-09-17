import 'package:bank_app_4/screen/home_page.dart';
import 'package:bank_app_4/screen/my_cards_page.dart';
import 'package:bank_app_4/screen/settings_page.dart';
import 'package:bank_app_4/screen/statistics_page.dart';
import 'package:bank_app_4/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  final List<Widget> pages = [
    const HomePage(),
    const MyCardsPage(),
    const StatisticsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavBar(
        indexSelected: currentTabIndex,
        onChangeTab: (index) {
          setState(() {
            currentTabIndex = index;
          });
        },
      ),
      body: pages[currentTabIndex],
    );
  }
}
