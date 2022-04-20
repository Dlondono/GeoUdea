import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geoudea/ui/information.dart';
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
  Set<Marker> sitios={};
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
    //markers.add(marker);
  }
  @override
  Widget build(BuildContext context) {
    var marker = Marker(
      markerId: MarkerId('_udeaMarker'),
      infoWindow: InfoWindow(title: "Está aca",
      ),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(6.2678311, -75.5688568),
    );
    markers.add(marker);

     var bloque19 = Marker(
      markerId: const MarkerId('_19'),
      infoWindow: InfoWindow(title: "19",onTap: (){
      }),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268201, -75.567318),
    );
     var canchaFutbol = Marker(
      markerId: const MarkerId('Cancha de futbol'),
      infoWindow: const InfoWindow(title: "Cancha de futbol"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26943,-75.56957),
    );
     var prometeo = Marker(
      markerId: const MarkerId('Prometeo cristo cayendo'),
      infoWindow: const InfoWindow(title: "Prometo cristo cayendo"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26742,-75.56831),
    );
     var placa = Marker(
      markerId: const MarkerId('Placa atlética'),
      infoWindow: const InfoWindow(title: "Placa atlética"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26967, -75.56873),
    );
     var editorial = Marker(
      markerId: const MarkerId('Tienda universitaria'),
      infoWindow: InfoWindow(title: "Tienda universitaria", onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Information(title: "Tienda universitaria",description: "Lugar donde los estudiantes pueden comprar articulos referentes a la universidad de Antioquia",products: "Libros, camisas, afiches, busos",)));}),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26908, -75.5671),
    );
     var parqueadero1 = Marker(
      markerId: const MarkerId('Parqueadero'),
      infoWindow: const InfoWindow(title: "Parqueadero"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26687, -75.56782),
    );
     var parqueadero2 = Marker(
      markerId: const MarkerId('Parqueadero'),
      infoWindow: const InfoWindow(title: "Parqueadero"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26748, -75.57047),
    );
     var museo = Marker(
      markerId: const MarkerId('Museo universitario'),
      infoWindow: InfoWindow(title: "Museo universitario", onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Information(title: "Museo Universitario",description: "Espacio en el cual se encuentra diferentes historias y culturas de la humanidad",products: "Recuerdos, esculturas, llaveros",)));}),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26733, -75.56977),
    );
     var creador = Marker(
      markerId: const MarkerId('Hombre creador de energía'),
      infoWindow: const InfoWindow(title: "Hombre creador de energía"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26729, -75.56938),
    );
     var reloj = Marker(
      markerId: const MarkerId('Reloj solar'),
      infoWindow: const InfoWindow(title: "Reloj solar"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26715, -75.56738),
    );
     var fuente = Marker(
      markerId: const MarkerId('Fuente'),
      infoWindow: const InfoWindow(title: "Fuente"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26761,-75.56886),
    );
     var chelista = Marker(
      markerId: const MarkerId('Chelista'),
      infoWindow: const InfoWindow(title: "Chelista"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26784, -75.57033),
    );
     var teatro = Marker(
      markerId: const MarkerId('Teatro al aire libre'),
      infoWindow: InfoWindow(title: "Teatro al aire libre", onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Information(title: "Teatro al aire libre",description: "Sitio donde los estudiante realizan sus estudios y practican diversas actividades",products: "Ninguno",)));}),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26598, -75.56773),
    );
     var cruzado = Marker(
      markerId: const MarkerId('Yo cruzado'),
      infoWindow: const InfoWindow(title: "Yo cruzado"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.2663, -75.56844),
    );
     var piscina = Marker(
      markerId: const MarkerId('Piscina'),
      infoWindow: const InfoWindow(title: "Piscina"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26893,-75.56871),
    );
     var coliseo = Marker(
      markerId: const MarkerId('Coliseo'),
      infoWindow: const InfoWindow(title: "Coliseo"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26948,-75.56817),
    );
     var bloque18 = Marker(
      markerId: const MarkerId('_18'),
      infoWindow: const InfoWindow(title: "18"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.267686,-75.567550),
    );
     var bloque20 = Marker(
      markerId: const MarkerId('_20'),
      infoWindow: const InfoWindow(title: "20"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268466,-75.567955),
    );
     var bloque21 = Marker(
      markerId: const MarkerId('_21'),
      infoWindow: const InfoWindow(title: "21"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268071, -75.568044),
    );
     var bloque16 = Marker(
      markerId: const MarkerId('_16'),
      infoWindow: const InfoWindow(title: "Bloque administrativo"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.267339769841178, -75.56832390001215),
    );
     var bloque22 = Marker(
      markerId: const MarkerId('_22'),
      infoWindow: const InfoWindow(title: "Bienestar"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268261508984546, -75.56862438922317),
    );
     var bloque23 = Marker(
      markerId: const MarkerId('_23'),
      infoWindow: const InfoWindow(title: "Teatro Camilo Torres"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.267918487819269, -75.56931989469766),
    );
     var bloque24 = Marker(
      markerId: const MarkerId('_24'),
      infoWindow: const InfoWindow(title: "24"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268209944788204, -75.56978903035593),
    );
     var bloque25 = Marker(
      markerId: const MarkerId('_25'),
      infoWindow: const InfoWindow(title: "25"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.267842260585144, -75.56987924875176),
    );
     var Museo = Marker(
      markerId: const MarkerId('Museo'),
      infoWindow: const InfoWindow(title: "Museo"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26731763755064, -75.56975745392864),
    );
     var biblioteca = Marker(
      markerId: const MarkerId('Biblioteca'),
      infoWindow: const InfoWindow(title: "Biblioteca"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26687820930663, -75.56900864124334),
    );
     var bloque1 = Marker(
      markerId: const MarkerId('_1'),
      infoWindow: const InfoWindow(title: "1"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.265501630650777, -75.56874700788474),
    );
     var bloque2 = Marker(
      markerId: const MarkerId('_2'),
      infoWindow: const InfoWindow(title: "2"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26581550883376, -75.56813803371296),
    );
     var bloque3 = Marker(
      markerId: const MarkerId('_3'),
      infoWindow: const InfoWindow(title: "3"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266129386827957, -75.56823727394836),
    );
     var bloque4 = Marker(
      markerId: const MarkerId('_4'),
      infoWindow: const InfoWindow(title: "4"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.2663311654388165, -75.56785384576612),
    );
     var bloque5 = Marker(
      markerId: const MarkerId('_5'),
      infoWindow: const InfoWindow(title: "5"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266685398811369, -75.5683184705046),
    );
     var bloque6 = Marker(
      markerId: const MarkerId('_6'),
      infoWindow: const InfoWindow(title: "6"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266407392893724, -75.56880113892224),
    );
     var bloque7 = Marker(
      markerId: const MarkerId('_7'),
      infoWindow: const InfoWindow(title: "7"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266026491534717, -75.56893707658489),
    );
     var tal = Marker(
      markerId: const MarkerId('_tal'),
      infoWindow: const InfoWindow(title: "Teatro al aire libre"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266057879329937, -75.56783190123608),
    );
     var bloque9 = Marker(
      markerId: const MarkerId('_9'),
      infoWindow: const InfoWindow(title: "9"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.265748485266017, -75.57003323009411),
    );
     var bloque10 = Marker(
      markerId: const MarkerId('_10'),
      infoWindow: const InfoWindow(title: "10"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.2663358854337945, -75.56991143525974),
    );
     var bloque11 = Marker(
      markerId: const MarkerId('_11'),
      infoWindow: const InfoWindow(title: "11"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.26682015377711, -75.56987985882121),
    );
     var bloque12 = Marker(
      markerId: const MarkerId('_12'),
      infoWindow: const InfoWindow(title: "12"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266972608532897, -75.57031290712115),
    );
     var bloque13 = Marker(
      markerId: const MarkerId('_13'),
      infoWindow: const InfoWindow(title: "13"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266604923457791, -75.57052492035133),
    );
     var bloque14 = Marker(
      markerId: const MarkerId('_14'),
      infoWindow: const InfoWindow(title: "14"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266183430491957, -75.57052040943154),
    );
     var cafe_19 = Marker(
      markerId: const MarkerId('cafe_19'),
      infoWindow: InfoWindow(title: "Domo cafe bloque 19", onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Information(title: "Domo cafe bloque 19",description: "Lugar donde los estudiantes se relajan y toman café",products: "Café, almuerzos",)));}),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.2682759552649205, -75.5674484225269),
    );
     var restaurante_ing = Marker(
      markerId: const MarkerId('restaurante_ing'),
      infoWindow:  InfoWindow(title: "Restaurante Mall de Ingeniería",onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Information(title: "Restaurante Mall de Ingeniería",description: "No se",products: "Venden cosas",)));
      }),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268501471130584, -75.5682935746535),
    );
     var restaurante_gourmet = Marker(
      markerId: const MarkerId('restaurante_gourmet'),
      infoWindow: const InfoWindow(title: "Restaurante punto gourmet"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268698476182211, -75.56844720063013),
    );
     var cafe_lolita = Marker(
      markerId: const MarkerId('cafe_lolita'),
      infoWindow: const InfoWindow(title: "De Lolita Universidad de Antioquia"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268408305276694, -75.56846960686548),
    );
     var bebidas_juguitos = Marker(
      markerId: const MarkerId('bebidas_juguitos'),
      infoWindow: const InfoWindow(title: "Jugos y Frutas, Juguitos"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268420987804438, -75.56857725930975),
    );
     var cafe_25 = Marker(
      markerId: const MarkerId('cafe_25'),
      infoWindow: InfoWindow(title: "Domo cafe bloque 25 Artes",onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Information(title: "Domo cafe bloque 25 Artes",description: "Lugar para todo tipo de estudiante",products: "bebidas, almuerzos, café",)));}),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268222046579488, -75.56940609548589),
    );
     var pizzeria_artes = Marker(
      markerId: const MarkerId('pizzeria_artes'),
      infoWindow: const InfoWindow(title: "Pizzeria de Artes"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.268318923906767, -75.57006228909076),
    );
     var cafe_13 = Marker(
      markerId: const MarkerId('cafe_13'),
      infoWindow: const InfoWindow(title: "Domo cafe bloque 13 Ciencias Económicas"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.2667033955079114, -75.57027705945048),
    );
     var cafe_14 = Marker(
      markerId: const MarkerId('cafe_14'),
      infoWindow: const InfoWindow(title: "Domo cafe bloque 14 Derecho"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266315986732626, -75.57062352350854),
    );
     var cafe_9 = Marker(
      markerId: const MarkerId('cafe_9'),
      infoWindow: const InfoWindow(title: "Domo cafe bloque 9 Humanidades"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.2655886706123605, -75.56960521197996),
    );
     var cafe_5 = Marker(
      markerId: const MarkerId('cafe_5'),
      infoWindow: const InfoWindow(title: "Domo cafe bloque 5 Microbiología"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: const LatLng(6.266555433838761, -75.56866257471555),
    );
    deporte={canchaFutbol,piscina,coliseo,placa};
    sitios={fuente,prometeo,chelista,parqueadero1,parqueadero2,museo,creador,reloj,teatro,cruzado,editorial};
    comida={cafe_5,cafe_9,cafe_13,cafe_14,cafe_19,cafe_25,cafe_lolita,restaurante_gourmet,restaurante_ing,bebidas_juguitos,pizzeria_artes};
    bloques={bloque19,bloque1,bloque2,bloque3,bloque4,bloque5,bloque6,bloque7,bloque9,bloque10,bloque11,
      bloque12,bloque13,bloque14,bloque16,bloque18,bloque19,bloque20,bloque21,bloque22,bloque23,bloque24,bloque25,biblioteca};
    getMarkers();
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
          markers=comida;
        });
        return;
      case "bloques":
        setState(() {
          markers=bloques;
        });
        return;
      case "estudio":
        setState(() {
        //markers=estudio;
      });
      return;
      case "deportes":
        setState(() {
        markers=deporte;
      });
      return;
      case "sitios":
        setState(() {
          markers=sitios;
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
 /*  const marker = Marker(
    markerId: MarkerId('_udeaMarker'),
    infoWindow: InfoWindow(title: "Está aca"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(6.2678311, -75.5688568),
  );*/
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