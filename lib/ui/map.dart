import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../models/markers.dart';

class Map extends StatefulWidget {
  String? category;
  Map({this.category});
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Markers model=Markers();
  Set<Marker> markers=<Marker>{};
  Set<Marker> deporte={};
  Set<Marker> bloques={};
  Set<Marker> comida={};
  Completer<GoogleMapController> _controller = Completer();

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
    getMarkers();
    markers.add(marker);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /* appBar: AppBar(
       backgroundColor: Colors.green,
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
            ),
              onPressed: (){
            getDirections();
          }, child: Text("Ruta"),
          )
        ],
      ),*/
      body: GoogleMap(
        mapToolbarEnabled: false,
        rotateGesturesEnabled: false,
        tiltGesturesEnabled: false,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        compassEnabled: false,
        polylines: _polylines,
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

  void getMarkers()async {
    switch (widget.category) {

      case "comida":
        setState(() {
          markers=model.comida;
        });
        return;
      case "bloques":
        setState(() {
          markers=model.bloques;
        });
        return;
      case "estudio":
        setState(() {
        //markers=estudio;
      });
      return;
      case "deportes":
        setState(() {
        markers=model.deporte;
      });
      return;
      case "computo":
        setState(() {
        //markers=computo;
      });
      return;
      default:{
        setState(() {

        });
      }
      return;
    }
  }
  static const marker = Marker(
    markerId: MarkerId('_udeaMarker'),
    infoWindow: InfoWindow(title: "Está aca"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(6.2678311, -75.5688568),
  );
  Set<Polyline> _polylines=Set<Polyline>();
  Future<void> getDirections()async {

    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=6.2678311,-75.5688568&destination=6.268201,-75.56731&mode=walking8&key=AIzaSyDYLgFxzXahao8xixKWkFcvnO4N8cxcrus';
    var response= await http.get(Uri.parse(url));
    var json=convert.jsonDecode(response.body);
    var result={
      'bounds_ne':json['routes'][0]['bounds']['northeast'],
      'bounds_sw':json['routes'][0]['bounds']['southwest'],
      'start_location':json['routes'][0]['legs'][0]['start_location'],
      'end_location':json['routes'][0]['legs'][0]['end_location'],
      'polyline':json['routes'][0]['overview_polyline']['points'],
      'polyline_decoded': PolylinePoints().decodePolyline(json['routes'][0]['overview_polyline']['points']),
    };
    //print(result);
    _setPolyline(result['polyline_decoded']);

  }
  int polylineIdCounter=1;
  void _setPolyline(List<PointLatLng> points){
    setState(() {

      print(points);
      final String polylineIdVal='polylineId_$polylineIdCounter';
      polylineIdCounter++;
      _polylines.add(Polyline(
          polylineId: PolylineId(
              polylineIdVal),
          width: 3,
          color: Colors.blue,
          points: points.map((point)=> LatLng(point.latitude, point.longitude),
          ).toList()
      )
      );
    });

  }
}