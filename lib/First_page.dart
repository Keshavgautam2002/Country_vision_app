import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/business_screen.dart';
import 'package:news_app/sports_page.dart';
import 'package:news_app/world_page.dart';
import 'Home_page.dart';
import 'contact_us.dart';

void main() => runApp(const First_page());


class First_page extends StatefulWidget {
  const First_page({Key? key}) : super(key: key);

  @override
  State<First_page> createState() => _First_pageState();
}

class _First_pageState extends State<First_page> {
  int _currentIndex = 0;
  final screen = [
    const Home_page(),
    const Business_page(),
    const World_page(),
    const Sports_page(),
    const Contact_page(),
  ];
  void _onTapped(int index)
  {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.money_dollar),label: "Business"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.globe),label: "World"),
          BottomNavigationBarItem(icon: Icon(Icons.sports_football_outlined),label: "Sports"),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.phone),label: "Contact us"),
        ],
        selectedFontSize: 13,
        selectedLabelStyle: GoogleFonts.lato(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue.shade200,
        currentIndex: _currentIndex,
        onTap: _onTapped,
        elevation: 10,
      ),
      body: screen[_currentIndex],
        );
  }
}