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
  static var bloque18 = Marker(
    markerId: MarkerId('_18'),
    infoWindow: InfoWindow(title: "18"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.267686,-75.567550),
  );
  static var bloque20 = Marker(
    markerId: MarkerId('_20'),
    infoWindow: InfoWindow(title: "20"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268466,-75.567955),
  );
  static var bloque21 = Marker(
    markerId: MarkerId('_21'),
    infoWindow: InfoWindow(title: "21"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268071, -75.568044),
  );
  static var bloque16 = Marker(
    markerId: MarkerId('_16'),
    infoWindow: InfoWindow(title: "Bloque administrativo"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.267339769841178, -75.56832390001215),
  );
  static var bloque22 = Marker(
    markerId: MarkerId('_22'),
    infoWindow: InfoWindow(title: "Bienestar"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268261508984546, -75.56862438922317),
  );
  static var bloque23 = Marker(
    markerId: MarkerId('_23'),
    infoWindow: InfoWindow(title: "Teatro Camilo Torres"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.267918487819269, -75.56931989469766),
  );
  static var bloque24 = Marker(
    markerId: MarkerId('_24'),
    infoWindow: InfoWindow(title: "24"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268209944788204, -75.56978903035593),
  );
  static var bloque25 = Marker(
    markerId: MarkerId('_25'),
    infoWindow: InfoWindow(title: "25"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.267842260585144, -75.56987924875176),
  );
  static var Museo = Marker(
    markerId: MarkerId('Museo'),
    infoWindow: InfoWindow(title: "Museo"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.26731763755064, -75.56975745392864),
  );
  static var biblioteca = Marker(
    markerId: MarkerId('Biblioteca'),
    infoWindow: InfoWindow(title: "Biblioteca"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.26687820930663, -75.56900864124334),
  );
  static var bloque1 = Marker(
    markerId: MarkerId('_1'),
    infoWindow: InfoWindow(title: "1"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.265501630650777, -75.56874700788474),
  );
  static var bloque2 = Marker(
    markerId: MarkerId('_2'),
    infoWindow: InfoWindow(title: "2"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.26581550883376, -75.56813803371296),
  );
  static var bloque3 = Marker(
    markerId: MarkerId('_3'),
    infoWindow: InfoWindow(title: "3"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266129386827957, -75.56823727394836),
  );
  static var bloque4 = Marker(
    markerId: MarkerId('_4'),
    infoWindow: InfoWindow(title: "4"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.2663311654388165, -75.56785384576612),
  );
  static var bloque5 = Marker(
    markerId: MarkerId('_5'),
    infoWindow: InfoWindow(title: "5"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266685398811369, -75.5683184705046),
  );
  static var bloque6 = Marker(
    markerId: MarkerId('_6'),
    infoWindow: InfoWindow(title: "6"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266407392893724, -75.56880113892224),
  );
  static var bloque7 = Marker(
    markerId: MarkerId('_7'),
    infoWindow: InfoWindow(title: "7"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266026491534717, -75.56893707658489),
  );
  static var tal = Marker(
    markerId: MarkerId('_tal'),
    infoWindow: InfoWindow(title: "Teatro al aire libre"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266057879329937, -75.56783190123608),
  );
  static var bloque9 = Marker(
    markerId: MarkerId('_9'),
    infoWindow: InfoWindow(title: "9"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.265748485266017, -75.57003323009411),
  );
  static var bloque10 = Marker(
    markerId: MarkerId('_10'),
    infoWindow: InfoWindow(title: "10"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.2663358854337945, -75.56991143525974),
  );
  static var bloque11 = Marker(
    markerId: MarkerId('_11'),
    infoWindow: InfoWindow(title: "11"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.26682015377711, -75.56987985882121),
  );
  static var bloque12 = Marker(
    markerId: MarkerId('_12'),
    infoWindow: InfoWindow(title: "12"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266972608532897, -75.57031290712115),
  );
  static var bloque13 = Marker(
    markerId: MarkerId('_13'),
    infoWindow: InfoWindow(title: "13"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266604923457791, -75.57052492035133),
  );
  static var bloque14 = Marker(
    markerId: MarkerId('_14'),
    infoWindow: InfoWindow(title: "14"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266183430491957, -75.57052040943154),
  );
  static var cafe_19 = Marker(
    markerId: MarkerId('cafe_19'),
    infoWindow: InfoWindow(title: "Domo cafe bloque 19"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.2682759552649205, -75.5674484225269),
  );
  static var restaurante_ing = Marker(
    markerId: MarkerId('restaurante_ing'),
    infoWindow: InfoWindow(title: "Restaurante Mall de Ingeniería"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268501471130584, -75.5682935746535),
  );
  static var restaurante_gourmet = Marker(
    markerId: MarkerId('restaurante_gourmet'),
    infoWindow: InfoWindow(title: "Restaurante punto gourmet"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268698476182211, -75.56844720063013),
  );
  static var cafe_lolita = Marker(
    markerId: MarkerId('cafe_lolita'),
    infoWindow: InfoWindow(title: "De Lolita Universidad de Antioquia"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268408305276694, -75.56846960686548),
  );
  static var bebidas_juguitos = Marker(
    markerId: MarkerId('bebidas_juguitos'),
    infoWindow: InfoWindow(title: "Jugos y Frutas, Juguitos"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268420987804438, -75.56857725930975),
  );
  static var cafe_25 = Marker(
    markerId: MarkerId('cafe_25'),
    infoWindow: InfoWindow(title: "Domo cafe bloque 25 Artes"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268222046579488, -75.56940609548589),
  );
  static var pizzeria_artes = Marker(
    markerId: MarkerId('pizzeria_artes'),
    infoWindow: InfoWindow(title: "Pizzeria de Artes"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.268318923906767, -75.57006228909076),
  );
  static var cafe_13 = Marker(
    markerId: MarkerId('cafe_13'),
    infoWindow: InfoWindow(title: "Domo cafe bloque 13 Ciencias Económicas"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.2667033955079114, -75.57027705945048),
  );
  static var cafe_14 = Marker(
    markerId: MarkerId('cafe_14'),
    infoWindow: InfoWindow(title: "Domo cafe bloque 14 Derecho"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266315986732626, -75.57062352350854),
  );
  static var cafe_9 = Marker(
    markerId: MarkerId('cafe_9'),
    infoWindow: InfoWindow(title: "Domo cafe bloque 9 Humanidades"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.2655886706123605, -75.56960521197996),
  );
  static var cafe_5 = Marker(
    markerId: MarkerId('cafe_5'),
    infoWindow: InfoWindow(title: "Domo cafe bloque 5 Microbiología"),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    position: LatLng(6.266555433838761, -75.56866257471555),
  );

}