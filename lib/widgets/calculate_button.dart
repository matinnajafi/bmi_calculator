import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  final VoidCallback onPressed; // callBack for calculate button

  const CalculateButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 23, 116, 40),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: GestureDetector(
        onTap: onPressed, // Use the provided callback
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
          child: Text(
            '! محاسبه کن',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
