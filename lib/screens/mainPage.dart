import 'package:flutter/material.dart';
import 'package:letmeyoureyes/constants/colors.dart';

class MainPage extends StatefulWidget {
  static const String pageRoute = "/";
  double volumeOfSound = 0.1;
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.volumeOfSound < 0 || widget.volumeOfSound > 10) {
      widget.volumeOfSound = 0.1;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome back"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
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
      ),
      // drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: const BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Column(
      //           children: [
      //             const Text('Drawer Header'),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             const Text(
      //               "volume of sound",
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Slider(
      //                 value: widget.volumeOfSound,
      //                 onChanged: (value) {
      //                   setState(() {
      //                     widget.volumeOfSound = value;
      //                   });
      //                 })
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(
      //           Icons.home,
      //         ),
      //         title: const Text('Page 1'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(
      //           Icons.train,
      //         ),
      //         title: const Text('Page 2'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "you are using the app as:",
              style: TextStyle(
                  color: MainColors.secondColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 48,
                    width: 188.5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MainColors.secondColor,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(184, 178, 178, 1),
                            width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: MainColors.primaryColor,
                            shadowColor: MainColors.secondColor,
                            elevation: 9.0,
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 55, right: 55)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/otp");
                        },
                        child: const Text(
                          "blind person",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 60,
                    width: 182.5,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: MainColors.secondColor,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(184, 178, 178, 1), width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: MainColors.primaryColor,
                            shadowColor: MainColors.secondColor,
                            elevation: 9.0,
                            padding: const EdgeInsets.only(
                                top: 20, bottom: 20, left: 61.9, right: 61.9)),
                        onPressed: () {
                          Navigator.pushNamed(context, "/phone");
                        },
                        child: const Text(
                          "family of \n blind",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                          textAlign: TextAlign.center,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// drawer: Drawer(
      //   child: ListView(
      //     // Important: Remove any padding from the ListView.
      //     padding: EdgeInsets.zero,
      //     children: [
      //       DrawerHeader(
      //         decoration: const BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //         child: Column(
      //           children: [
      //             const Text('Drawer Header'),
      //             const SizedBox(
      //               height: 10,
      //             ),
      //             const Text(
      //               "volume of sound",
      //               style: TextStyle(
      //                 color: Colors.white,
      //               ),
      //             ),
      //             Slider(
      //                 value: volumeOfSound,
      //                 onChanged: (value) {
      //                   setState(() {
      //                     volumeOfSound = value;
      //                   });
      //                 })
      //           ],
      //         ),
      //       ),
      //       ListTile(
      //         leading: const Icon(
      //           Icons.home,
      //         ),
      //         title: const Text('Page 1'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //       ListTile(
      //         leading: const Icon(
      //           Icons.train,
      //         ),
      //         title: const Text('Page 2'),
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),