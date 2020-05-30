import 'package:flutter/material.dart';
import 'package:my_stocks/features/onboarding/onBoarding.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Stocks',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: OnBoarding(),
    );
  }
}

