import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_challenge/features/activity/view/activity_screen.dart';
import 'package:tiktok_challenge/features/home/view/home_screen.dart';
import 'package:tiktok_challenge/features/profile/view/profile_screen.dart';
import 'package:tiktok_challenge/features/search/view/search_screen.dart';
import 'package:tiktok_challenge/features/write/view/write_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    SearchScreen(),
    WriteScreen(),
    ActivityScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            ...List.generate(
              _screens.length,
              (index) {
                return Offstage(
                  offstage: _currentIndex != index,
                  child: TickerMode(
                    enabled: _currentIndex == index,
                    child: _screens[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house), label: ""),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.searchengin), label: ""),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.squarePlus), label: ""),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart), label: ""),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user), label: ""),
          ],
        ),
      ),
    );
  }
}
