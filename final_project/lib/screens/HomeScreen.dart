import 'dart:ffi';

import 'package:final_project/models/userModel.dart';
import 'package:final_project/nav-drawer.dart';
import 'package:final_project/screens/EditFormScreen.dart';
import 'package:final_project/screens/donorDetailScreen.dart';
import 'package:final_project/screens/donorList.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';

import '../bottom-navigation.dart';

class HomeScreen extends StatefulWidget {
  // UserModel? userModel;
  // HomeScreen({this.userModel});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /* _getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
    print(e);
    }
    Object? long;
    print(long);
    }
  } */

  // final Geolocator geolocator = Geolocator();
  // late Position _currentPosition;
  // late String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/blue-bg.png'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/235621/pexels-photo-235621.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        ),
                        DropdownButton<String>(
                          hint: Text(
                            'Current Location',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          items: <String>['Pakistan', 'China', 'Iran', 'UAE']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                        /* if (_currentPosition != null) Text(_currentAddress), */
                        /*  ElevatedButton(
                          child: Text("Get location"),
                          onPressed: () {
                            _getCurrentLocation();
                          },
                        ), */
                        Stack(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications,
                                  size: 50,
                                  color: Color.fromRGBO(233, 216, 63, 1),
                                )),
                            Positioned(
                              top: 10,
                              right: 0,
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                radius: 8,
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Hello, ',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            TextSpan(
                              text: 'User!',
                              /* text: widget.userModel!.firstName, */
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                    child: Text(
                      'Please donate if you are somebody’s type!',
                      style: TextStyle(
                          color: Color.fromRGBO(29, 69, 147, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                  //   child: Container(
                  //     width: double.infinity,
                  //     decoration: BoxDecoration (
                  //       border: Border(
                  //           bottom: BorderSide(width: 1, color: Color.fromRGBO(24, 32, 35, 0.5), style: BorderStyle.solid)
                  //         ),
                  //       ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(bottom: 5),
                  //       child: Text(
                  //         'Much is Needed',
                  //         style: TextStyle(
                  //             color: Color.fromRGBO(29, 69, 147, 1),
                  //             fontSize: 24,
                  //             fontWeight: FontWeight.w600),
                  //             textAlign: TextAlign.left,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color.fromARGB(75, 202, 205, 204),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => DonorList()));
                                        },
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        DonorList()));
                                          },
                                          child: Text(
                                            'Meet Heroes',
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    24, 32, 35, 1),
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          'Blood Donors, Life savers in your area',
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(24, 32, 35, 1),
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color.fromARGB(75, 202, 205, 204),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Give Blood',
                                      style: TextStyle(
                                          color: Color.fromRGBO(24, 32, 35, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                      textAlign: TextAlign.center,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        'Find blood requests near you. Save Someone’s life.',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(24, 32, 35, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            'Every 2 Seconds',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 32, 35, 0.7),
                                fontSize: 30,
                                fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'Frequency that someone in the U.S needs blood.',
                          style: TextStyle(
                              color: Color.fromRGBO(24, 32, 35, 0.5),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 40, 15, 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    foregroundColor:
                                        Color.fromRGBO(24, 32, 35, 0.5),
                                    child: Icon(
                                      Icons.bloodtype,
                                      color: Color.fromRGBO(29, 69, 147, 1),
                                      size: 50,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 8),
                                    child: Text(
                                      '41,000+',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(24, 32, 35, 0.7),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    'Blood donations needed per day.',
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 32, 35, 0.5),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    foregroundColor:
                                        Color.fromRGBO(24, 32, 35, 0.5),
                                    child: Icon(
                                      Icons.calendar_month,
                                      color: Color.fromRGBO(29, 69, 147, 1),
                                      size: 50,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 8),
                                    child: Text(
                                      '30M',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(24, 32, 35, 0.7),
                                          fontSize: 24,
                                          fontWeight: FontWeight.w400),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Text(
                                    'Total blood components transferred each year in the U.S.',
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 32, 35, 0.5),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
