import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';

class SampleAddInfo extends StatelessWidget {
  const SampleAddInfo({
    super.key,
    required this.theIcon,
    required this.theIconColor,
     this.theValue,
    required this.theText,
  });

  final theIcon;
  final theIconColor;
  final theValue;
  final theText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          theIcon,
          color: theIconColor,
        ),
        VerticalSizedBox(5),
        Text(
          theValue,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        VerticalSizedBox(5),
        Text(
          theText,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        )
      ],
    );
  }
}
