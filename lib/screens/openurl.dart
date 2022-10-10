import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class OpenURL extends StatefulWidget {
  static const String page_Route = "/openurl";
  OpenURL({Key? key}) : super(key: key);

  @override
  State<OpenURL> createState() => _OpenURLState();
}

class _OpenURLState extends State<OpenURL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(
            textDirection: TextDirection.rtl,
            child: Center(child: Text("Open URL in web"))),
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
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                children: [
                  const Text('Drawer Header'),
                  const SizedBox(
                    height: 10,
                  ),

                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
              ),
              title: const Text('Log out'),
              onTap: () {
                _signOut();
                Navigator.popAndPushNamed(context, "/splash");
              },
            ),

          ],
        ),
      ),


      body: Padding(

        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 300,width: 200,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))
                ),

                onPressed: () async {
                  final url = 'https://www.google.com/maps/@31.2798855,37.122627,7z';
                  openBrowserURL(url: url, inApp: true);
                },

                child: Text("Open URL in Browser ", style: TextStyle(fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),)),
          ],
        ),
      ),
    );
  }

  Future <void> openBrowserURL({
    required String url,
    bool inApp = false,
  }) async {
    if (await canLaunch(url)) {
      await launch(url,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
