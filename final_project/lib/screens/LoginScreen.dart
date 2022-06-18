import 'package:final_project/screens/HomeScreen.dart';
import 'package:final_project/screens/RegistrationScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
                      'Welcome',
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
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          style: TextStyle(height: 0.5),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: 'Password',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                            suffixIcon: Icon(Icons.lock_outline,
                                color: Color.fromRGBO(165, 160, 160, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                            color: Color.fromRGBO(239, 108, 98, 1),
                            fontSize: 12),
                      ),
                    ),
                  ],
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
                        child: const Text('Login',
                            style: TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252))),
                        onPressed: () {
                           Navigator.push(context,
                      MaterialPageRoute(builder: (_) => HomeScreen()));
                        },
                      )),
                ),
                Row(
                  children: <Widget>[
                    const Text('Does not have account?',
                        style:
                            TextStyle(color: Color.fromRGBO(165, 160, 160, 1))),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style:
                            TextStyle(color: Color.fromRGBO(239, 108, 98, 1)),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                      MaterialPageRoute(builder: (_) => RegistrationScreen()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 35,
                  ),
                  child: Container(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Image.asset(
                          'assets/images/google-logo.png',
                          height: 40.0,
                          width: 40.0,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: new Text(
                              "Sign in with google",
                              style: TextStyle(fontSize: 15.0),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
