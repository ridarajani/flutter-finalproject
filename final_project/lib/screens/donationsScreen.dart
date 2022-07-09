import 'dart:ui';
import 'package:final_project/screens/donationsGiven.dart';
import 'package:final_project/screens/donationsReceived.dart';
import 'package:final_project/screens/requestReceived.dart';
import 'package:final_project/screens/requestsSent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DonationsScreen extends StatefulWidget {
  const DonationsScreen({Key? key}) : super(key: key);

  @override
  State<DonationsScreen> createState() => _DonationsScreenState();
}

class _DonationsScreenState extends State<DonationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12.0, bottom: 7.0),
                  child: Text(
                    'Donations Of Blood',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 67, 149, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'See received blood donations and also check your donations',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 67, 149, 1), fontSize: 12),
                  ),
                ),
              ],
            ),
            elevation: 0,
            /* flexibleSpace: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/background.jpg'),
                      fit: BoxFit.fill)),
            ), */
            backgroundColor: Colors.white,
            bottom: const TabBar(
              labelColor: Color.fromRGBO(0, 67, 149, 1),
              unselectedLabelColor: Color.fromRGBO(35, 119, 191, 1),
              indicatorWeight: 3,
              indicatorColor: Color.fromRGBO(0, 67, 149, 1),
              tabs: [
                Tab(
                  child: Text(
                    'Donations Given',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Donations Received',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(
                decoration: BoxDecoration(color: Colors.white),
                child: DonationsGiven()),
            DonationsReceived()
          ]),
        ),
      ),
    );
  }
}
