import 'package:flutter/material.dart';

// Custom textfield widget for weight and height input
Widget getTextField(TextEditingController controller, String hintText) {
  return SizedBox(
    width: 150,
    child: TextField(
      controller: controller,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.deepOrange,
      ),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.deepOrange.withOpacity(0.5)),
      ),
    ),
  );
}
