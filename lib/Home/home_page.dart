import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:schoolender_flutter/Authentication/welcome_screen.dart';
import 'package:schoolender_flutter/Calendar/calendar_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var data = widget.data;
    return Scaffold(
      body: PageView(
        onPageChanged: (int) {
          setState(() {
          currentpage = int;
          });
        },
        controller: pageController,
        children: [
          Scaffold(
            appBar: AppBar(
        title: Text('Home Page'),
        leading: IconButton(
            icon: Icon(
              Icons.logout,
            ),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => WelcomePage(),
                ),
              );
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add_circle_rounded,
              ),
              onPressed: () async {}),
        ],
      ),
            body: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.5),
                          child: ListTile(
                            title: Text(
                              'Full Name: ${data['firstName']} ${data['lastName']}',
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            enableFeedback: true,
                            onTap: () {},
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
          CalendarPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        enableFeedback: true,
        currentIndex: currentpage,
        onTap: (int) {
          print(int);
          setState(() {
            currentpage = int;
            pageController.animateToPage(
              int,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.solidCalendar),
            label: 'Calendar',
          ),
        ],
      ),
    );
  }
}

