import 'package:google_maps_flutter/google_maps_flutter.dart';

class Markers{
  Set<Marker> deporte={canchaFutbol,piscina,coliseo};

  static const marker = Marker(
    markerId: MarkerId('_udeaMarker'),
    infoWindow: InfoWindow(title: "Está aca"),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(6.2678311, -75.5688568),
  );
  static var bloque19 = Marker(
    markerId: MarkerId('_19'),
    infoWindow: InfoWindow(title: "19"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268201, -75.567318),
  );
  static var canchaFutbol = Marker(
    markerId: MarkerId('Cancha de futbol'),
    infoWindow: InfoWindow(title: "Cancha de futbol"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.26943,-75.56957),
  );
  static var piscina = Marker(
    markerId: MarkerId('Piscina'),
    infoWindow: InfoWindow(title: "Piscina"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.26893,-75.56871),
  );
  static var coliseo = Marker(
    markerId: MarkerId('Coliseo'),
    infoWindow: InfoWindow(title: "Coliseo"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.26948,-75.56817),
  );

}