import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesPage extends StatefulWidget {
  @override
  _PlacesPageState createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  GoogleMapController controller;
  final Set<Marker> markers = Set<Marker>();

  @override
  Widget build(BuildContext context) {
    final CameraPosition _initialCameraPosition = CameraPosition(
      target: LatLng(-34.582149724423346, -58.43416795989902),
      zoom: 17,
      tilt: 50,
    );

    markers.add(
      Marker(
        markerId: MarkerId('UNIQUE'),
        infoWindow: InfoWindow(snippet: 'Estilo Veggie'),
        position: LatLng(-34.582149724423346, -58.43416795989902),
      ),
    );

    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        zoomControlsEnabled: false,
        mapType: MapType.terrain,
        markers: markers,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (GoogleMapController _controller) => controller = _controller,
      ),
    );
  }
}
