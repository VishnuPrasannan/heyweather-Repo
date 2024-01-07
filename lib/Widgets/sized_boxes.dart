
import 'package:flutter/material.dart';

class VerticalSizedBox extends StatelessWidget {
  const VerticalSizedBox(this.height, {Key? key}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSizedBox extends StatelessWidget {
  const HorizontalSizedBox(this.width, {Key? key}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}