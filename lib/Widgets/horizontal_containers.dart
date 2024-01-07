import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';


class SideScrollers extends StatelessWidget {
  final String text;
  final String subtext;
  final IconData icon;

  const SideScrollers({super.key, required this.text, required this.subtext, required this.icon});

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 100,
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerticalSizedBox(10),
            Text(
              text,
              style: const TextStyle(fontSize: 15),
            ),
            Icon(
              icon,
              size: 20,
            ),
            Text(subtext,style: TextStyle(fontSize: 10),)
          ],
        ),

      );

  }
}
