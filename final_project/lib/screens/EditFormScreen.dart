import 'package:final_project/screens/UserProfile.dart';
import 'package:flutter/material.dart';

class EditFormScreen extends StatefulWidget {
  @override
  State<EditFormScreen> createState() => _EditFormScreenState();
}

class _EditFormScreenState extends State<EditFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'My Details',
                      style: TextStyle(
                          color: Color.fromRGBO(239, 108, 98, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 0,
                    vertical: 10,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'User Name',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'DOB',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Confirm Password',
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromRGBO(129, 175, 161, 1))),
                        child: const Text('Sign Up',
                            style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => UserProfile()));
                        },
                      )),
                ),
              ],
            )));
  }
}
