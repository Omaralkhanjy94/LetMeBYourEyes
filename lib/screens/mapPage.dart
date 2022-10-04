// "AIzaSyDlw0WIKpNb1_hE-oY9sWh4b_x_6U8v0yE"
// static const LatLng sourceLocation =
//       LatLng(32.052705521622876, 35.88461650188103);
import 'dart:async';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  MapPage({Key? key, this.title}) : super(key: key);
  final String? title;
  double volumeOfSound = 0.1;
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng sourceLocation =
      LatLng(32.052705521622876, 35.88461650188103);
  StreamSubscription? _locationSubscription; //stream to put location listening
  final Location _locationTracker = Location();
  Marker? marker;
  Circle? circle;
  GoogleMapController? _controller;
  Set<Polyline> pathPolyline = <Polyline>{};
  List<LatLng> lL = <LatLng>[];

  static const CameraPosition initialLocation = CameraPosition(
    target: sourceLocation,
    zoom: 19.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData =
        await DefaultAssetBundle.of(context).load("assets/images/blindd.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircleAndPath(
      LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    setState(() {
      marker = Marker(
          markerId: const MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading!,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: const Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: const CircleId("car"),
          radius: newLocalData.accuracy!,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
      lL.add(latlng);
      pathPolyline.add(
        Polyline(
            polylineId: const PolylineId('1'),
            color: Colors.yellow,
            width: 5,
            points: lL,
            patterns: [
              PatternItem.dash(20),
              PatternItem.gap(10),
            ]),
      );
    });
  }

  void getCurrentLocation() async {
    try {
      Uint8List imageData = await getMarker();

      var location = await _locationTracker.getLocation();

      updateMarkerAndCircleAndPath(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }

      _locationSubscription =
          _locationTracker.onLocationChanged.listen((newLocalData) {
        if (_controller != null) {
          _controller!.animateCamera(CameraUpdate.newCameraPosition(
              CameraPosition(
                  bearing: 90.8334901395799,
                  target:
                      LatLng(newLocalData.latitude!, newLocalData.longitude!),
                  tilt: 0,
                  zoom: 18.00)));
          updateMarkerAndCircleAndPath(newLocalData, imageData);
        }
      });
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.volumeOfSound < 0 || widget.volumeOfSound > 10) {
      widget.volumeOfSound = 0.1;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Directionality(
            textDirection: TextDirection.rtl,
            child: Center(child: Text("Blind person tracking"))),
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
                  const Text(
                    "volume of sound",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Slider(
                      value: widget.volumeOfSound,
                      onChanged: (value) {
                        setState(() {
                          widget.volumeOfSound = value;
                        });
                      })
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
            // ListTile(
            //   leading: const Icon(
            //     Icons.train,
            //   ),
            //   title: const Text('Page 2'),
            //   onTap: () {
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker!] : []),
        circles: Set.of((circle != null) ? [circle!] : []),
        polylines: pathPolyline,
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
      ),
      floatingActionButton: Container(
        padding: const EdgeInsets.only(
          right: 35,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
                child: const Icon(Icons.location_searching),
                onPressed: () {
                  getCurrentLocation();
                }),
            const SizedBox(
              width: 5,
            ),
            FloatingActionButton(
                child: const Icon(Icons.close),
                onPressed: () {
                  if (_locationSubscription != null) {
                    _locationSubscription!.cancel();
                  }
                }),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
