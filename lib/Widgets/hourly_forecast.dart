import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key,required this.time,required this.icon, required this.temperature});
  final time;
  final icon;
  final temperature;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const HorizontalSizedBox(20),
        Column(
          children: [
           Text(time,style: const TextStyle(fontSize: 20),),
            const VerticalSizedBox(10),
            Icon(icon,size: 30,),
            const VerticalSizedBox(10),
            Text(temperature,style: const TextStyle(fontSize: 20))
          ],
        ),
      ],
    );
  }
}
