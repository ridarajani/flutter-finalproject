import 'package:final_project/screens/resetPasswordScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailaddressController = TextEditingController();
  @override
  void dispose() {
    emailaddressController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 250.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 35, 10, 0),
                child: ListView(children: [
                  Column(
                    children: [
                      Container(
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                                color: Color.fromRGBO(0, 67, 149, 1),
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
                              child: TextFormField(
                                controller: emailaddressController,
                                style: TextStyle(height: 0.5),
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Email Address',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(165, 160, 160, 1)),
                                  fillColor:
                                      Color.fromRGBO(240, 240, 240, 0.86),
                                  filled: true,
                                  suffixIcon: Icon(Icons.email_outlined,
                                      color: Color.fromRGBO(165, 160, 160, 1)),
                                ),
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                // validator: (email) => email != null && !EmailValidator.validate(email) ? 'Enter a valid email' : null,
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
                                      Color.fromRGBO(0, 67, 149, 1))),
                              child: const Text('Reset Password',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 252, 252, 252))),
                              onPressed: () {
                                //                 FirebaseAuth.instance
                                // .sendPasswordResetEmail(email: emailaddressController.text.trim());
                                print(emailaddressController.text.trim());
                                verifyEmail();
                              },
                            )),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          )),
    );
  }

  Future verifyEmail() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      print(emailaddressController.text.trim());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailaddressController.text.trim());
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      print('helooooo');
      Navigator.of(context).pop();
    }
  }
}
