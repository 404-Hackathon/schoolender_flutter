import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:schoolender_flutter/Home/home_page.dart';
import 'package:schoolender_flutter/widgets/AdaptiveText.dart';
import 'package:shimmer/shimmer.dart';

class LoadingPage extends StatelessWidget {
  LoadingPage({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(auth.currentUser!.uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic>? data =
              snapshot.data!.data() as Map<String, dynamic>?;
          return HomePage(data: data!);
        }

        return Material(
          child: Center(
            child: Shimmer.fromColors(
              baseColor: Colors.blueGrey,
              highlightColor: Colors.grey,
              child: AdaptiveText(
                'Loading...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
