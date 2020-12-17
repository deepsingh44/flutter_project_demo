import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapDemo extends StatefulWidget {
  @override
  _GoogleMapDemoState createState() => _GoogleMapDemoState();
}

class _GoogleMapDemoState extends State<GoogleMapDemo> {
  GoogleMapController mapController;
  List<Marker> allMarkers = [];
  final LatLng _center = const LatLng(28.6773, 77.3882);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    allMarkers.add(Marker(
      infoWindow: InfoWindow(
          title: "Ducat Institute", snippet: "Education Sector"),
      markerId: MarkerId("MyMarker"),
      icon: BitmapDescriptor.defaultMarker,
      position: _center,
      draggable: true,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          compassEnabled: true,
          mapType: MapType.normal,
          trafficEnabled: true,
          zoomControlsEnabled: true,
          scrollGesturesEnabled: true,
          buildingsEnabled: true,

          //myLocationEnabled: true,
          //myLocationButtonEnabled: true,
          //mapToolbarEnabled: true,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 16.0,
          ),
          markers: allMarkers.toSet(),
        ),
      ),
    );
  }
}
