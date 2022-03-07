import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class Map extends StatefulWidget {
  String? category;
  Map({this.category});
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Set<Marker> markers={bloque19,marker};
  Completer<GoogleMapController> _controller = Completer();
  static const marker = Marker(
    markerId: MarkerId('_udeaMarker'),
    infoWindow: InfoWindow(title: "Está aca"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(6.2678311, -75.5688568),
  );
  static var bloque19 = Marker(
    markerId: MarkerId('_19'),
    infoWindow: InfoWindow(title: "19"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
    position: LatLng(6.268201, -75.567318),
  );
  static const CameraPosition _udeaGeneral = CameraPosition(
    target: LatLng(6.2678311, -75.5688568),
    zoom: 16.9746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(6.2682559, -75.5686284),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    permissions();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("GeoUdea"),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.menu))
        ],
      ),
      body: GoogleMap(
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: false,
        markers: markers,
        mapType: MapType.hybrid,
        initialCameraPosition: _udeaGeneral,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      /*floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),*/
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void permissions() async{
    if (await Permission.location.request().isGranted) {
    // Either the permission was already granted before or the user just granted it.
    }
  }
}