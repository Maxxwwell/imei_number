import 'package:flutter/material.dart';
import 'package:imei_number/constants/colors.dart';
import 'package:imei_number/screens/Homepage.dart';
import 'package:imei_number/screens/scan.dart';
import 'package:imei_number/screens/sentCodes.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  _BottomTabsState createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const Home(),
    const Scan(),
    const SentCodes(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
        backgroundColor: AppColors.white,
        elevation: 0,
        iconSize: 26,
        selectedItemColor: AppColors.yellow,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        // showUnselectedLabels: false,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.qr_code_scanner,
            ),
            icon: Icon(Icons.qr_code),
            label: 'Scan code',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.inventory),
            icon: Icon(Icons.inventory_2_outlined),
            label: 'Records',
          ),
        ],
      ),
    );
  }
}
