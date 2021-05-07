import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Authentication/login_screen.dart';
import 'Authentication/register_screen.dart';
import 'Authentication/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyApp',
      theme: ThemeData(
        brightness: Brightness.light,
        accentColor: Colors.orange,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.orangeAccent,
      ),
      themeMode: ThemeMode.system,
      home: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.redAccent,
            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return WelcomePage();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Scaffold(
            // backgroundColor: Colors.blueAccent,
            body: Center(
              child: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/5/54/Ajux_loader.gif/240px-Ajux_loader.gif'),
            ),
          );
        },
      ),
    );
  }
}
