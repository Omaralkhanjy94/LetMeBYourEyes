import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:letmeyoureyes/constants/colors.dart';
import 'package:letmeyoureyes/screens/mapPage.dart';
import 'package:letmeyoureyes/screens/openurl.dart';
import 'package:letmeyoureyes/screens/phone.dart';
import 'package:pinput/pinput.dart';

class VerifyCode extends StatefulWidget {
  // static const String pageRoute = "/verifypage";
  const VerifyCode({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: const Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    var code = "";

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Verification Page"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.indigo,
                  Colors.indigoAccent,
                  Colors.lightBlue,
                  Colors.cyan,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body:
            // const Text(
            //         "Let Me B your eyes",
            //         style: TextStyle(
            //             fontSize: 30, letterSpacing: 3.7, fontFamily: 'LuckiestGuy'),
            //       ),
            Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const Text(
                        "Phone Verification",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "We need to register your phone without getting started!",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Pinput(
                        length: 6,
                        defaultPinTheme: defaultPinTheme,
                        focusedPinTheme: focusedPinTheme,
                        submittedPinTheme: submittedPinTheme,
                        showCursor: true,
                        onChanged: (value) {
                          code = value;
                        },
                        onCompleted: (pin) => print(pin),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () async {
                              try {
                                PhoneAuthCredential credential =
                                    PhoneAuthProvider.credential(
                                        verificationId: MyPhone.verify,
                                        smsCode: code);

                                // Sign the user in (or link) with the credential
                                await auth.signInWithCredential(credential);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, OpenURL.page_Route, (rout) => false);
                              } catch (e) {
                                if (kDebugMode) {
                                  print("wrong otp");
                                }
                              }
                            },
                            child: const Text("Verify Phone Number")),
                      ),
                      Row(
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  '/phone',
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                "Edit Phone Number ?",
                                style: TextStyle(color: Colors.black),
                              ))
                        ],
                      )
                    ],
                  ),
                )));
  }
}
