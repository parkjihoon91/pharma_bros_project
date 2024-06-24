import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharma_bros_project/common/const/path.dart';
import 'package:pharma_bros_project/main/my/view/my_info_screen.dart';

import '../../common/utils/custom_text_style.dart';
import '../home/view/home_screen.dart';

const double _iconWidth = 24;
const double _iconHeight = 24;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeScreen(),
            MyInfoScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapBottomNavigation,
        items: [
          createBottomNaviItem(
            path: 'svg_Icon-home-default.svg',
            activePath: 'svg_Icon-home-selected.svg',
            label: '홈',
          ),
          createBottomNaviItem(
            path: 'svg_Icon-my-default.svg',
            activePath: 'svg_Icon-my-selected.svg',
            label: '내정보',
          ),
        ],
        currentIndex: _currentIndex,
        selectedLabelStyle: CustomTextStyle.textStyleBody3,
        selectedItemColor: const Color(0xff202022),
        unselectedLabelStyle: CustomTextStyle.textStyleBody3,
        unselectedItemColor: const Color(0xffB3B5BB),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void onTapBottomNavigation(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem createBottomNaviItem({
    required String path,
    required String activePath,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        '$baseImagePath$path',
        width: _iconWidth,
        height: _iconHeight,
      ),
      activeIcon: SvgPicture.asset(
        '$baseImagePath$activePath',
        width: _iconWidth,
        height: _iconHeight,
      ),
      label: label,
    );
  }
}
