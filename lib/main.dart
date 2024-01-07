import 'package:flutter/material.dart';
import 'package:hey_weather/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Weather Mate',
        home: const SplashScreen(),
        theme: ThemeData.light(useMaterial3: true)

    );
  }
}
