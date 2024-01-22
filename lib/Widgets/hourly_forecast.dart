import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key,required this.time,required this.icon, required this.temperature, this.color});
  final time;
  final icon;
  final color;
  final temperature;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizontalSizedBox(20),
        Column(
          children: [
           Text(time,),
            const VerticalSizedBox(10),
            Icon(icon,size: 30,color: color,),
            const VerticalSizedBox(10),
            Text(temperature,style: const TextStyle(fontSize: 20))
          ],
        ),
      ],
    );
  }
}
