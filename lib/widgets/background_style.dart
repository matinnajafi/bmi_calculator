import 'package:flutter/material.dart';

class getBackground extends StatelessWidget {
  const getBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff2F3651), Color(0xff24293E)],
        ),
      ),
    );
  }
}
