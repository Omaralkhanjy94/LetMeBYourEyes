import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:letmeyoureyes/screens/mapPage.dart';
import 'package:letmeyoureyes/screens/mainPage.dart';
import 'package:letmeyoureyes/screens/phone.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splashIconSize: 600,
        splash: Image.asset(
          "assets/images/splash.gif",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        backgroundColor: Colors.blue,
        nextScreen: MainPage());
  }
}
