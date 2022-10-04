// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:letmeyoureyes/constants/colors.dart';
// import 'package:letmeyoureyes/screens/mainPage.dart';

// class RegistrationPage extends StatefulWidget {
//   static const String pageRoute = "/registrationpage";
//   const RegistrationPage({Key? key}) : super(key: key);

//   @override
//   State<RegistrationPage> createState() => _RegistrationPageState();
// }

// class _RegistrationPageState extends State<RegistrationPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Registration Page"),
//         // leading: Builder(
//         //   builder: (BuildContext context) {
//         //     return IconButton(
//         //       icon: const Icon(Icons.menu),
//         //       onPressed: () {
//         //         Scaffold.of(context).openDrawer();
//         //       },
//         //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
//         //     );
//         //   },
//         // ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Colors.indigo,
//                 Colors.indigoAccent,
//                 Colors.lightBlue,
//                 Colors.cyan,
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               const Text(
//                 "Let Me B your eyes",
//                 style: TextStyle(
//                     fontSize: 30,
//                     letterSpacing: 3.7,
//                     fontFamily: 'LuckiestGuy'),
//               ),
//               // SizedBox(
//               //   height: 5,
//               // ),
//               const Text(
//                 "Please enter your phone number",
//                 style: TextStyle(fontSize: 25),
//               ),
//               // SizedBox(
//               //   height: 10,
//               // ),
//               TextField(
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(5),
//                         borderSide: const BorderSide(width: 3))),
//               ),
//               // SizedBox(
//               //   height: 10,
//               // ),
//               Stack(
//                 children: [
//                   Center(
//                     child: Container(
//                       height: 60,
//                       width: 165,
//                       decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(5)),
//                         color: MainColors.secondColor,
//                       ),
//                     ),
//                   ),
//                   Center(
//                     child: Container(
//                       decoration: BoxDecoration(
//                           border: Border.all(
//                               color: const Color.fromRGBO(184, 178, 178, 1),
//                               width: 1),
//                           borderRadius: BorderRadius.circular(5)),
//                       child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               primary: MainColors.primaryColor,
//                               shadowColor: MainColors.secondColor,
//                               elevation: 9.0,
//                               padding: const EdgeInsets.only(
//                                   top: 20, bottom: 20, left: 55, right: 55)),
//                           onPressed: () {
//                             FirebaseAuth.instance.verifyPhoneNumber(
//                               phoneNumber: '+962785644358',
//                               verificationCompleted:
//                                   (PhoneAuthCredential credential) {},
//                               verificationFailed: (FirebaseAuthException e) {},
//                               codeSent:
//                                   (String verificationId, int? resendToken) {},
//                               codeAutoRetrievalTimeout:
//                                   (String verificationId) {},
//                             );
//                           },
//                           child: const Text(
//                             "continue",
//                             style: TextStyle(color: Colors.white, fontSize: 14),
//                             textAlign: TextAlign.center,
//                           )),
//                     ),
//                   ),
//                 ],
//               ),
//             ]),
//       ),
//     );
//   }
// }
