import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'widgets/footer.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => MapState();
}
Geolocator geolocator = Geolocator();

class MapState extends State<Map> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(13.8564165, 100.5418248),
    zoom: 15,
  );

  static final Marker _k_JIB_Themall_Marker = Marker(
      markerId: MarkerId('_KGooglePlex'),
      infoWindow: InfoWindow(title: 'JIB The Mall'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(13.8552931, 100.5420215));
  static final Marker _k_JIB_Pantip_marker = Marker(
      markerId: MarkerId('_KGooglePlex'),
      infoWindow: InfoWindow(title: 'JIB Pantip'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      position: LatLng(13.8576675, 100.5375127));

  Future<void> _goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    Position position = await Geolocator.getCurrentPosition();
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 15)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {_k_JIB_Themall_Marker, _k_JIB_Pantip_marker},
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      bottomNavigationBar: Footer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCurrentLocation,
        child: Icon(Icons.location_searching),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
