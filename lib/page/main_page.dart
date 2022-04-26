import 'package:book_library/page/home_page.dart';
import 'package:book_library/resource/dimen.dart';
import 'package:book_library/resource/string.dart';
import 'package:flutter/material.dart';

import 'library_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = const [HomePage(), LibraryPage()];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        iconSize: bottomNavIconSize,
/*        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        unselectedIconTheme:const IconThemeData(color: Colors.grey) ,
          selectedFontSize: 18,
        selectedIconTheme: const IconThemeData(color: Colors.blue),
        selectedItemColor: Colors.blue,*/

        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: bottomNavHome),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.book,
              ),
              label: bottomNavLibrary),
        ],
      ),
    );
  }
}
