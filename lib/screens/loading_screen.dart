import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bmi_claculator/widgets/background_style.dart';
import 'package:lottie/lottie.dart';

import 'home_screen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ), // After 3 secend Navigate to HomeScreen
      );
    });

    // Make the app full-screen and hide the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const getBackground(), // Background gradient
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 65),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Lottie.asset(
                  'assets/animations/balance.json',
                ), // Animation for loading screen
              ),
              const SizedBox(height: 12),
              const Text(
                'تعادل و تناسب، کلید سلامتی',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 16),
              const Text(
                'محاسبه شاخص توده بدنی شما برای کمک به حفظ سلامت',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const Text(
                '!و تناسب اندام',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              const Spacer(),
              Container(
                width: 80,
                height: 80,
                margin: const EdgeInsets.only(bottom: 60),
                child: Lottie.asset(
                  'assets/animations/loading.json',
                ), // Loading animation
              ),
            ],
          ),
        ],
      ),
    );
  }
}
