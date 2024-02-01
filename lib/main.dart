import 'package:extra_tech/screens/onboarding/splash.dart';
import 'package:flutter/material.dart';

import 'util/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: extraTechTheme,
      home: const SplashScreen(),
    );
  }
}
