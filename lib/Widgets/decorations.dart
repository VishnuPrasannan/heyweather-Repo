import 'package:flutter/material.dart';
import 'package:hey_weather/Widgets/sized_boxes.dart';

class Decorations extends StatelessWidget {
  const Decorations({super.key, required this.apiText, required this.apiTextFontSize,required this.icon,required this.iconSize});
  final apiText;
  final apiTextFontSize;
  final icon;
  final iconSize;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const HorizontalSizedBox(30),
        Text(
          apiText,
          style:  TextStyle(
              color: Colors.white,fontSize: apiTextFontSize ),
        ),

         Icon(
         icon,
          color: Colors.white38,
          size:iconSize
        )
      ],
    );
  }
}
