// ignore_for_file: prefer_const_constructors

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class map extends StatefulWidget {
late double lat,lng;
  @override
  _mapState createState() => _mapState();
  map.withlatlng(this.lat,this.lng);
}

class _mapState extends State<map> {
  var myMarkers = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.lat, widget.lng),
          zoom: 19),
          onMapCreated: (GoogleMapController googleMapController){
            setState(() {
              myMarkers.add(
                Marker(
                  markerId: MarkerId('1'),
                  position: LatLng(widget.lat, widget.lng),)
              );
            });
          },
          markers: myMarkers,
          ),
    );
  }
}