import 'package:final_project/screens/HomeScreen.dart';
import 'package:final_project/screens/UserProfile.dart';
import 'package:final_project/screens/requestsSent.dart';
import 'package:final_project/screens/requestsScreen.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'App Name',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 108, 98, 10),
              /* image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg')) */
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text('Home'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomeScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('My Profile'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => UserProfile()))
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Appointments'),
            onTap: () => {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => RequestsScreen()))
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
