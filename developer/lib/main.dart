import 'package:developer/models/mapdetails.dart';
import 'package:developer/screen/stalls.dart';
import 'package:developer/screens/date_time.dart';
import 'package:developer/screens/delivery_address.dart';
import 'package:developer/screens/details.dart';
import 'package:developer/screens/home.dart';
import 'package:developer/screens/log_screen.dart';
import 'package:developer/screens/mapview.dart';
import 'package:developer/screens/onboarding_screen.dart';
import 'package:developer/screens/payment.dart';
import 'package:developer/screens/sigu.dart';
import 'package:developer/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Safari Movers',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        OnBoardingScreen.id: (context) => OnBoardingScreen(),
        Sigu.id: (context) => Sigu(),
        Login.id: (context) => Login(),
        //MenuPage.id: (context) => MenuPage(),
        HomePage.id: (context) => HomePage(),
        MapView.id: (context) => MapView(),
        Calendar.id: (context) => Calendar(),
        Stall.id: (context) => Stall(),
        Deliver.id: (context) => Deliver(),
        BookData.id: (context) => BookData(),
        // DetailScro.id: (context) => DetailScro(detail: de,),
        //ForgotPassword.id:(context)=> ForgotPassword(),
      },
    );
  }
}
