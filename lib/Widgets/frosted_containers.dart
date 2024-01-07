import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedContainers extends StatelessWidget {
  const FrostedContainers(
      {super.key, this.theWidth, this.theHeight, this.theChild});

  final theWidth;
  final theHeight;
  final theChild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
          height: theHeight,
          width: theWidth,
          color: Colors.transparent,
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.13)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black54.withOpacity(0.40),
                          Colors.black54.withOpacity(0.40)
                        ])),
                child: theChild,
              )
            ],
          )),
    );
  }
}
