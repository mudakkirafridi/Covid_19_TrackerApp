import 'package:coronavirus_tracker_app/screens/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Covid_19 Tracker App",
      theme: ThemeData(brightness: Brightness.dark, primarySwatch: Colors.teal),
      home: splashScreen(),
    );
  }
}
