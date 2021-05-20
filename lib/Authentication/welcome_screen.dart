import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolender_flutter/Authentication/login_screen.dart';
import 'package:schoolender_flutter/Authentication/register_screen.dart';
import 'package:schoolender_flutter/Home/home_page.dart';
 
 
class WelcomePage extends StatefulWidget {
  WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // setUp();

    auth.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomePage(),
        //   ),
        // );
      }
    });

    // getFullName();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Login'),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage(),),)
                  ),
                  ElevatedButton(
                  child: Text('Register'),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage(),),)
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}