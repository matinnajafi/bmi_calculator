import 'package:flutter/material.dart';
import 'package:flutter_bmi_claculator/constants/constants.dart';
import 'package:flutter_bmi_claculator/widgets/calculate_button.dart';
import 'package:flutter_bmi_claculator/widgets/horizontal_shape.dart';
import 'package:flutter_bmi_claculator/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightcontroller = TextEditingController();
  final heightcontroller = TextEditingController();
  double resultBMI = 0; // default BMI value
  String resultText = '';
  double widthgood = 100; // default width for good result
  double widthbad = 100; // default width for bad result
  double opacity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تو چنده؟ BMI',
          style: TextStyle(color: blackcolor, fontSize: 24),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            color: Colors.blue,
            iconSize: 24,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return getHintDialog(); // show hint dialog for user
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 15),
              getWeightAndHeighBox(
                weightcontroller: weightcontroller,
                heightcontroller: heightcontroller,
              ),
              const SizedBox(height: 30),
              CalculateButton(
                onPressed: () {
                  final weight = double.parse(
                    weightcontroller.text,
                  ); // parse weight input(get the weight from text field)
                  final height = double.parse(
                    heightcontroller.text,
                  ); // parse height input(get the height from text field)

                  setState(() {
                    resultBMI = weight / (height / 100 * height / 100);
                    /* calculate BMI:
                    BMI = weight / (height in meters * height in meters)
                    where height in meters = height in cm / 100
                    */
                    opacity = 1;

                    if (resultBMI > 25) {
                      resultText = 'شما اضافه وزن دارید'; // Overweight!
                      widthbad = 270;
                      widthgood = 40;
                    } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                      resultText = 'وزن شما نرمال است'; // Normal weight.
                      widthbad = 40;
                      widthgood = 270;
                    } else {
                      resultText =
                          'وزن شما از حد نرمال کمتر است'; // Underweight!
                      widthbad = 40;
                      widthgood = 40;
                    }
                  });
                },
              ),
              const SizedBox(height: 35),
              getBMIResult(resultBMI: resultBMI),
              const SizedBox(height: 20),
              getResultText(opacity: opacity, resultText: resultText),
              const SizedBox(height: 25),
              // horizontal shape for bad result
              HorizontalShape(
                bottomLeftRadius: const Radius.circular(15),
                bottomRightRadius: const Radius.circular(0),
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.end,
                shapeColor: redbackground,
                text: 'شاخص منفی',
                shapeWidth: widthbad,
              ),
              const SizedBox(height: 15),
              // horizontal shape for good result
              HorizontalShape(
                bottomLeftRadius: const Radius.circular(0),
                bottomRightRadius: const Radius.circular(15),
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.start,
                shapeColor: greenbackground,
                text: 'شاخص مثبت',
                shapeWidth: widthgood,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
