import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:splashify/splashify.dart';
import 'package:spatial/style/theme.dart';

import 'app/start/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(context),
      home: Splashify(
        //title: 'Spatial',
        imagePath: 'assets/images/logo_header.png',
        navigateDuration: 5, // Navigate to the child widget after 3 seconds
        child: OnBoardingScreen(), // Your main app screen widget
      ),
    );
  }
}

