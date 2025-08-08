import 'package:flutter/material.dart';
import 'package:flutter_bmi_claculator/widgets/custome_textfield.dart';

// Display the hint dialog about how to use the app
class getHintDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 6.0),
                  const Text(
                    'چطور از این برنامه استفاده کنم؟',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'این برنامه به شما کمک میکنه شاخص توده بدنیتون رو حساب کنید فقط کافیه قد و وزن رو وارد کنید و نتیجه رو ببینید',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.withOpacity(0.6),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'متوجه شدم',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Display the result text based on BMI calculation
class getResultText extends StatelessWidget {
  const getResultText({required this.opacity, required this.resultText});

  final double opacity; // opacity for animation
  final String resultText; // text to display based on BMI result

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: opacity,
      child: Text(
        resultText,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}

// Display the calculated BMI value
class getBMIResult extends StatelessWidget {
  const getBMIResult({required this.resultBMI});

  final double resultBMI; // BMI value to display

  @override
  Widget build(BuildContext context) {
    return Text(
      resultBMI.toStringAsFixed(2), // format BMI to 2 decimal places
      style: const TextStyle(
        fontSize: 55,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}

// Display the text fields for weight and height input
class getWeightAndHeighBox extends StatelessWidget {
  const getWeightAndHeighBox({
    required this.weightcontroller,
    required this.heightcontroller,
  });

  final TextEditingController weightcontroller;
  final TextEditingController heightcontroller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        getTextField(weightcontroller, '(کیلوگرم)وزن'),
        getTextField(heightcontroller, '(سانتی‌متر)قد'),
      ],
    );
  }
}
