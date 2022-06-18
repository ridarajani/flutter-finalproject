import 'package:final_project/screens/resetPasswordScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
                    child: Image.asset('assets/images/registration.png')),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Forgot your Password?',
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
                            labelText: 'Email Address',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                            suffixIcon: Icon(Icons.email_outlined,
                                color: Color.fromRGBO(165, 160, 160, 1)),
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
                        child: const Text('Reset Password',
                            style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ResetPasswordScreen()));
                        },
                      )),
                ),
              ],
            )));
  }
}
