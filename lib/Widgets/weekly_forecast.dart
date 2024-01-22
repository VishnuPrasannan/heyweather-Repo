import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';

class WeeklyForecast extends StatelessWidget {
  const WeeklyForecast(
      {super.key,
      required this.day,
      required this.icon,
      required this.skyDescription,
      required this.temp});

  final day;
  final icon;
  final skyDescription;
  final temp;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VerticalSizedBox(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              day,
              style: const TextStyle(fontSize: 20),
            ),
            // const HorizontalSizedBox(10),
            Row(
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                HorizontalSizedBox(10),
                Text(skyDescription, style: const TextStyle(fontSize: 20))
              ],
            ),
            Text(temp, style: const TextStyle(fontSize: 20))
          ],
        ),
      ],
    );
  }
}
