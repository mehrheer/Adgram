import 'file:///C:/Users/HP/AndroidStudioProjects/adgram/lib/screens/signup.dart';
import 'package:adgram/screens/home.dart';
import 'package:flutter/material.dart';
import 'splash.dart';
import 'login.dart';
import 'listOfInfluencers.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'splash': (context) => SplashPage(),
        'login': (context) => Login(),
        'signup': (context) =>  SignUp(),
        'listofI': (context) => InfluencerList(),
        'home': (context) => HomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: 'splash',
      home: SplashPage(),
    );
  }
}
