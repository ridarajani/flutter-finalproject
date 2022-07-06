import 'package:final_project/models/userModel.dart';
import 'package:final_project/screens/HomeScreen.dart';
import 'package:final_project/screens/UserProfile.dart';
import 'package:final_project/screens/donationsScreen.dart';
import 'package:final_project/screens/donorList.dart';
import 'package:final_project/screens/requestsScreen.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

class BottomNavigation extends StatefulWidget {
  UserModel? userModel;
  BottomNavigation({this.userModel});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    RequestsScreen(),
    DonationsScreen(),
    UserProfile()
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[_currentIndex],
      bottomNavigationBar: SizedBox(
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              // icon: SizedBox(height: 50, child: Icon(AppIcons.user)),
              icon: Icon(Icons.search),
              label: 'Find Donor',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.post_add_rounded),
              label: 'Requests',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history_rounded),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          selectedItemColor: Color.fromRGBO(0, 67, 149, 1),
          unselectedItemColor: Color.fromRGBO(35, 119, 191, 1),
          iconSize: 40,
          backgroundColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          elevation: 5,
          selectedFontSize: 14,
          unselectedFontSize: 14,
        ),
      ),
    );
  }
}
