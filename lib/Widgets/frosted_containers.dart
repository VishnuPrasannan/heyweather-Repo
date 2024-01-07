import 'package:flutter/material.dart';
import 'dart:ui';

class FrostedContainers extends StatelessWidget {
  const FrostedContainers(
      {super.key,
        this.theWidth,
        this.theHeight,
        this.theChild});

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
                filter: ImageFilter.blur(sigmaX: 6, sigmaY:6),
                child: Container(),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white.withOpacity(0.15)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.black.withOpacity(0.30),
                          Colors.black.withOpacity(0.30)
                        ])),
                child: theChild,
              )
            ],
          )),
    );
  }
}
