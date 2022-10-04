// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:letmeyoureyes/screens/registration.dart';
import 'package:letmeyoureyes/screens/mainPage.dart';
import 'package:letmeyoureyes/screens/mapPage.dart';
import 'package:letmeyoureyes/screens/openurl.dart';
import 'package:letmeyoureyes/screens/phone.dart';
// import 'package:letmeyoureyes/screens/mapPage.dart';
// import 'package:letmeyoureyes/screens/login.dart';
// import 'package:letmeyoureyes/screens/mainPage.dart';
import 'package:letmeyoureyes/screens/splashPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:letmeyoureyes/screens/verificationPage.dart';

// import 'app_router.dart';
// import 'constnats/strings.dart';

late String initialRoute;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyC7caF-5KSKNVcG6qPw3y0vJ0yirIjeZqQ",
          appId: "704390507189",
          messagingSenderId: "704390507189",
          projectId: "letmebeyoureyes"));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Let me be your eyes',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // initialRoute: initialRoute,
      // home: sconst SplashScreen(),

      initialRoute: '/splash',
      routes: {
        // '/': (context) => MainPage(),
        '/splash': (context) => const SplashScreen(),
        '/phone': (context) => const MyPhone(),
        MainPage.pageRoute : (context)=> MainPage(),
        '/otp': (context) => const VerifyCode(),
        '/home': (context) => MapPage(),
        OpenURL.page_Route :(context)=> OpenURL(),
        // RegistrationPage.pageRoute: (context) => const RegistrationPage(),
      },
      // routes: {
      //   "/": (context) => MainPage(),
      //   RegistrationPage.pageRoute: (context) => RegistrationPage(),
      // },
    );
  }
}
