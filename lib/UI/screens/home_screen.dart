import 'package:flutter/material.dart';
import 'package:learning_system/UI/screens/profile_screen.dart';
import 'package:learning_system/UI/screens/saved_screen.dart';
import 'home_body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _isSelected = 0;
  List<Widget> myListScreen = [
    const HomeBody(),
    const SavedScreen(),
    const ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              _isSelected = index;
            });
          },
          currentIndex: _isSelected,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'الرئيسية',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline_rounded),
              label: 'المحفوظات',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined),
              label: 'ملفي',
            ),
          ],
        ),
        body: myListScreen.elementAt(_isSelected));
  }
}
