import 'package:eco_buy/screens/homeScreen.dart';
import 'package:eco_buy/screens/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  // const LandingScreen({Key? key}) : super(key: key);

  Future<FirebaseApp?> initilize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initilize,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot streamsnapshot){
              if (streamsnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("${streamsnapshot.error}"),
                  ),
                );
              }
              if(streamsnapshot.connectionState==ConnectionState.active){
                User? user = streamsnapshot.data;
                if(user==null){
                  return LoginScreen();
                }
                else{
                  return HomeScreen();
                }
              }
              return Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Checking Authentication.."),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Initialization.."),
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
