import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';
import '../Screens/home_screen.dart';

class Addinfo extends StatelessWidget {
  final IconData icons;
  final String text;
  final String maintext;
  final double iconSize;
  final double textSize;
  final double mainTextSize;

  const Addinfo({
    super.key,
    required this.icons,
    required this.text,
    required this.maintext,
    required this.iconSize,
    required this.textSize,
    required this.mainTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icons,
              size: iconSize,
              color: Colors.white,
            ),
            const VerticalSizedBox(8),

            Text(
              text,
              style: TextStyle(color: primarycolor, fontSize: textSize),
            ),
            const VerticalSizedBox(6),

            Text(
              maintext,
              style: TextStyle(fontSize: mainTextSize, color: primarycolor),
            ),
          ],
        ),
      ),
    );
  }
}
