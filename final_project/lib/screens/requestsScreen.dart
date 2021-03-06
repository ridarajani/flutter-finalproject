import 'dart:ui';
import 'package:final_project/screens/requestReceived.dart';
import 'package:final_project/screens/requestsSent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
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
                    'Requests For Blood',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 67, 149, 1),
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    'See received blood requests and also check your request status',
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
                    'Requests Sent',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Tab(
                  child: Text(
                    'Requests Received',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            Container(
                decoration: BoxDecoration(color: Colors.white),
                child: RequestsSent()),
            RequestsReceived()
          ]),
        ),
      ),
    );
  }
}
