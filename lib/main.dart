import 'package:flutter/material.dart';

import 'bills_page.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'usage_page.dart';

void main() {
  runApp(MaterialApp(
    home: MinimalistApp(),
  ));
}

class MinimalistApp extends StatefulWidget {
  const MinimalistApp({Key? key}) : super(key: key);

  @override
  _MinimalistAppState createState() => _MinimalistAppState();
}

class _MinimalistAppState extends State<MinimalistApp> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 300), // Adjust the duration as needed
        curve: Curves.easeInOut, // Use any desired curve
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _widgetOptions.length,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return AnimatedOpacity(
            opacity: _selectedIndex == index ? 1.0 : 0.0,
            duration: Duration(milliseconds: 300), // Adjust the duration as needed
            child: _widgetOptions[index],
          );
        },
      ),
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.electric_bolt),
            label: 'Usage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
            label: 'Bill',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    UsagePage(),
    BillsPage(),
    ProfilePage(),
  ];
}
