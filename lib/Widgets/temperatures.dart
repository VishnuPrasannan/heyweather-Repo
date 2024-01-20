import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';

class Temperatures extends StatelessWidget {
  const Temperatures({super.key,  required this.data1, required this.data2});
  final String data1;
  final String data2;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Column(
          children: [
            Image.asset(
           'assets/images/low temperature.png',
              height: 40,
              width: 40,
            ),

            Text(
              data1,
              style: const TextStyle(
             color: Colors.white,fontSize: 20)
            )
          ],
        ),
      const HorizontalSizedBox(100),

        Column(
          children: [
            Image.asset(
            'assets/images/hot temperature.png',
              height: 40,
              width: 40,
            ),

            Text(
              data2,
              style: const TextStyle(
             color: Colors.white,fontSize: 20)
            ),
          ],
        )
      ],
    );

  }
}
