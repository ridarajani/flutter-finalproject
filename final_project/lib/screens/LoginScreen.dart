import 'package:final_project/bottom-navigation.dart';
import 'package:final_project/screens/HomeScreen.dart';
import 'package:final_project/screens/forgotPasswordScreen.dart';
import 'package:final_project/screens/registrationScreen.dart';
import 'package:final_project/services/userDB.dart';
import 'package:final_project/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future loginUser() async {
    try {
      var usercredentials = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (usercredentials.user != null) {
        print(usercredentials.user!.uid);
        UserModel? userModel =
            await UserDB().getHadyaUser(usercredentials.user!.uid);
        await Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (_) {
          return BottomNavigation(
            userModel: userModel,
          );
        }), (route) => false);
      } else {
        print("No User Found");
      }
    } catch (e) {
      print("ErrorFound");
      print(e.toString());
    }
  }

  Future GoogleLogin() async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication? googleAuth =
            await googleUser.authentication;

        // Create a new credential
        final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

        try {
          final UserCredential userCredential =
              await auth.signInWithCredential(credential);

          // Once signed in, return the UserCredential

          // return await FirebaseAuth.instance.signInWithCredential(credential);

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            //handle error
            print('account exist with different credential');
          } else if (e.code == 'invalid-credential') {
            //handle error
            print('invalid credential');
          }
        } catch (e) {
          //handle error
          print('something else');
        }
      }
    } catch (e) {
      print("ErrorFound");
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
                          alignment: Alignment.center,
                          // padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Welcome',
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
                                controller: emailController,
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
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  labelText: 'Password',
                                  labelStyle: TextStyle(
                                      color: Color.fromRGBO(165, 160, 160, 1)),
                                  fillColor:
                                      Color.fromRGBO(240, 240, 240, 0.86),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => ForgotPasswordScreen()));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 67, 149, 1),
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
                                      Color.fromRGBO(0, 67, 149, 1))),
                              child: const Text('Login',
                                  style: TextStyle(
                                      color:
                                          Color.fromARGB(255, 252, 252, 252))),
                              onPressed: () {
                                loginUser();
                                /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BottomNavigation())); */
                              },
                            )),
                      ),
                      Row(
                        children: <Widget>[
                          const Text('Does not have account?',
                              style: TextStyle(
                                  color: Color.fromRGBO(165, 160, 160, 1))),
                          TextButton(
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                  color: Color.fromRGBO(0, 67, 149, 1)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => RegistrationScreen()));
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
                          child: InkWell(
                            onTap: () {
                              GoogleLogin();
                            },
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
