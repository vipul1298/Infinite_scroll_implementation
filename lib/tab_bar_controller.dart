import 'package:flutter/material.dart';
import 'package:yourstory_assign/first_page.dart';
import 'package:yourstory_assign/fourth_page.dart';
import 'package:yourstory_assign/second_page.dart';
import 'package:yourstory_assign/third_page.dart';

class TabBarController extends StatefulWidget {
  @override
  _TabBarControllerState createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int pageIndex = 0;

  List<Widget> _pages = [FirstPage(), SecondPage(), ThirdPage(), FourthPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          backgroundColor: Colors.grey,
          onTap: (ind) {
            setState(() {
              pageIndex = ind;
            });
          },
          currentIndex: pageIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.scanner), label: "Scanner"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info")
          ]),
      body: _pages[pageIndex],
    );
  }
}
