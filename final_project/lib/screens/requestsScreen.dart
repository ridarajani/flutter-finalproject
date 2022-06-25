import 'package:final_project/screens/appointmentScreen.dart';
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
            bottom: const TabBar(
              indicatorWeight: 5,
              indicatorColor: Color.fromRGBO(42, 122, 195, 1),
              tabs: [
                Tab(
                  child: Text('Requests Sent'),
                ),
                Tab(
                  child: Text('Requests Received'),
                ),
              ],
            ),
          ),
          body:
              TabBarView(children: [AppointmentScreen(), AppointmentScreen()]),
        ),
      ),
    );
  }
}
