import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../screens/helpline_screen.dart';
import '../screens/statistics_screen.dart';
import '../screens/todo_list_screen.dart';
import '../screens/about_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  int _currentIndexTab = 0;

  String dropDownValue = 'MAH';
  String contactNumber = '';
  String countryFlag = '';
  Map<String, String> contacts = {};

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.canvasColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _currentIndexTab,
        backgroundColor: Colors.white,
        unselectedItemColor: Color(0xFF40c4ff),
        selectedItemColor: MyColors.PRIMARY_COLOR,
        selectedLabelStyle: GoogleFonts.montserrat(
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
        onTap: (index) {
          setState(() {
            _currentIndexTab = index;
            _pageController.animateToPage(
              index,
              duration: Duration(
                milliseconds: 600,
              ),
              curve: Curves.easeIn,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Stats'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            title: Text('TODO'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('About'),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          HelplineScreen(),
          StatisticsScreen(),
          ToDoListScreen(),
          AboutScreen(),
        ],
        onPageChanged: (index) => setState(() {
          _currentIndexTab = index;
        }),
      ),
    );
  }
}
