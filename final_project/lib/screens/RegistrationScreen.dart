// import 'package:final_project/screens/UserProfile.dart';
import 'package:final_project/services/userDB.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => RegistrationScreenState();
}

class RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();

  Future registerUser() async {
    try {
      if (((passwordController.text).isNotEmpty &&
              (confirmPasswordController.text).isNotEmpty) &&
          passwordController.text == confirmPasswordController.text) {
        UserCredential usercredentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        if (usercredentials.user != null) {
          print(usercredentials.user!.uid);
          UserDB().createHadyaUser(
            firstNameController.text,
            lastNameController.text,
            usercredentials.user!.uid,
            090078601,
            '',
            '',
            '',
          );
        } else {
          print("No User Found");
        }
      } else {
        print("Password Fields don't match");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
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
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: firstNameController,
                          style: TextStyle(height: 0.5),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                            suffixIcon: Icon(Icons.account_circle_outlined,
                                color: Color.fromRGBO(165, 160, 160, 1)),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: lastNameController,
                          style: TextStyle(height: 0.5),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                            suffixIcon: Icon(Icons.account_circle_outlined,
                                color: Color.fromRGBO(165, 160, 160, 1)),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: emailController,
                          style: TextStyle(height: 0.5),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
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
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(height: 0.5),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
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
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          style: TextStyle(height: 0.5),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(
                                color: Color.fromRGBO(165, 160, 160, 1)),
                            fillColor: Color.fromRGBO(240, 240, 240, 0.86),
                            filled: true,
                            suffixIcon: Icon(Icons.lock_outline,
                                color: Color.fromRGBO(165, 160, 160, 1)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Container(
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: SizedBox(
                              width: 500,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromRGBO(0, 67, 149, 1))),
                                child: const Text('Sign Up',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 252, 252, 252))),
                                onPressed: () {
                                  registerUser();
                                },
                              ),
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
}
