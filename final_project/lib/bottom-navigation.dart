import 'package:final_project/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SizedBox(height: 50, child: Icon(AppIcons.user)),
            label: 'Find Donor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add_rounded),
            label: 'Requests',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cases_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
