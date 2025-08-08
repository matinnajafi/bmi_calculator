import 'package:flutter/material.dart';
import 'package:flutter_bmi_claculator/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'dana'), // dana is default font for this app
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
