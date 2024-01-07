import 'package:flutter/material.dart';
import '../Widgets/frosted_containers.dart';
import 'home_screen.dart';


class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Opacity(
        opacity: 0.6,
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Lp_bg.jpg'),
                  fit: BoxFit.cover)),
        ),
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: FrostedContainers(
            theWidth: 350.0,
            theHeight: 450.0,
            theChild: Center(
              child: Column(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Homepage()));
                      },
                      child: const Text(
                        'click here',
                        style: TextStyle(color: Colors.white),
                      )),
                  const Text('H',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
        ),
      )]);
  }
}
