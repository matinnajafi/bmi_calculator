import 'package:flutter/material.dart';
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
        title: const Text(
          'تو چنده؟ BMI',
          style: TextStyle(color: Colors.black, fontSize: 24),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getWeightAndHeighBox(
              weightcontroller: weightcontroller,
              heightcontroller: heightcontroller,
            ),
            const SizedBox(height: 35),
            _getCalculateButton(),
            const SizedBox(height: 35),
            getBMIResult(resultBMI: resultBMI),
            const SizedBox(height: 20),
            getResultText(opacity: opacity, resultText: resultText),
          ],
        ),
      ),
    );
  }

  Widget _getCalculateButton() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 23, 116, 40),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: GestureDetector(
        onTap: () {
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
            } else if (resultBMI >= 18.5 && resultBMI <= 25) {
              resultText = 'وزن شما نرمال است'; // Normal weight.
            } else {
              resultText = 'وزن شما از حد نرمال کمتر است'; // Underweight!
            }
          });
        },
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
