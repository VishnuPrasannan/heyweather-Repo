import 'package:flutter/material.dart';
import 'package:hey_weather/Screens/home_screen.dart';
import '../Widgets/sized_boxes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoHomepage();
  }

  Future<void> gotoHomepage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const Homepage()));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash.jpg', width: screenWidth * 0.3),
            const VerticalSizedBox(30),
           const Text('The Ultimate Weather Forecast Companion\n For Your  Daily GO')
          ],
        ),
      ),
    );
  }
}
