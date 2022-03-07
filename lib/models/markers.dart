import 'package:google_maps_flutter/google_maps_flutter.dart';

class Markers{
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

}