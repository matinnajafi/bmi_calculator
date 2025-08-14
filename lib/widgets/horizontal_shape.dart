import 'package:flutter/material.dart';

class HorizontalShape extends StatelessWidget {
  final double shapeWidth;
  final MainAxisAlignment mainAxisAlignment; // for left and right shapes
  final Color shapeColor;
  final String text; // shape title
  final TextDirection textDirection;
  final Radius bottomLeftRadius;
  final Radius bottomRightRadius;
  const HorizontalShape({
    super.key,
    required this.shapeWidth,
    required this.mainAxisAlignment,
    required this.shapeColor,
    required this.text,
    required this.textDirection,
    required this.bottomLeftRadius,
    required this.bottomRightRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: textDirection,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: mainAxisAlignment,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 700),
            height: 40,
            width: shapeWidth,
            decoration: BoxDecoration(
              color: shapeColor,
              borderRadius: BorderRadius.only(
                bottomRight: bottomRightRadius,
                bottomLeft: bottomLeftRadius,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(text, style: TextStyle(color: shapeColor)),
          const Spacer(),
        ],
      ),
    );
  }
}
