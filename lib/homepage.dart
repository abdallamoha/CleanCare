import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cleancare/services.dart';
import 'package:cleancare/servicedetail.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nanny App.',
      home: MyMap(),
    );
  }
}


class MyMap extends StatefulWidget {
  @override
  State<MyMap> createState() => MyMapSampleState();
}

class MyMapSampleState extends State<MyMap> {
  Completer<GoogleMapController> _controller = Completer();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  static const LatLng _center = const LatLng(-1.286389, 36.817223);
  LatLng _latLng;
//
  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _getLocation() async {
    var currentLocation = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    _latLng = LatLng(currentLocation.latitude, currentLocation.longitude);

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: _latLng, tilt: 50.0, bearing: 45.0, zoom: 20.0),
    ));
    final marker = Marker(
      markerId: MarkerId("curr_loc"),
      position: _latLng,
      infoWindow: InfoWindow(title: 'Your Location'),
      icon: BitmapDescriptor.defaultMarker,
    );
    setState(() {
      _markers.add(marker);
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        // resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        key: scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Test Username"),
                accountEmail: Text("Test Username2911@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? Colors.blue
                          : Colors.white,
                  backgroundImage: AssetImage('images/m.jpg'),
                ),
              ),
              ListTile(
                leading: Icon(Icons.input),
                title: Text('Welcome'),
                onTap: () => {},
              ),
              ListTile(
                leading: Icon(Icons.verified_user),
                title: Text('Profile'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(Icons.border_color),
                title: Text('Feedback'),
                onTap: () => {Navigator.of(context).pop()},
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  //FocusScope.of(context).requestFocus(new FocusNode());

                  Navigator.of(context).pop();
//                  Navigator.of(context).push(MaterialPageRoute(
//                      builder: (BuildContext context) => MyApp()));
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 15.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
              //myLocationEnabled: true,
              // myLocationButtonEnabled: true,
              padding: EdgeInsets.only(
                top: 50.0,
              ),
              compassEnabled: false,
            ),
            Positioned(
              left: 10,
              top: 20,
              child: IconButton(
                color: Colors.blueAccent,
                icon: Icon(Icons.menu),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 400),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0,
                      ),
                    ],
                    color: Colors.white,
                  ),
                  height: 50,
                  width: 300,
                  child: TextField(
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                        hintText: "What is Location?",
                        hintStyle:
                            TextStyle(fontFamily: 'Gotham', fontSize: 15),
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 60, bottom: 50),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: <Widget>[
                    RawMaterialButton(
                      elevation: 4.0,
                      onPressed: () {
                        setState(() {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ServicesDetail()));
                        });
                      },
                      fillColor: Colors.blue[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      constraints:
                          BoxConstraints.tightFor(width: 300, height: 50),
                      child: Text(
                        'Select you\'r Sevices',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.only(
                bottom: 90,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      elevation: 0.0,
                      onPressed: _getLocation,
                      materialTapTargetSize: MaterialTapTargetSize.padded,
                      backgroundColor: Colors.blue[300],
                      child: const Icon(Icons.my_location, size: 25.0),
                      heroTag: 'btn2',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
