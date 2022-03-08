import 'package:flutter/material.dart';


class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
          child: MyStatefulWidget(),
        );
  }
}

enum SingingCharacter {comida, bebida, areaDeEstudio, zonaWifi, deportes, salaDeComputo}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  SingingCharacter? _character = SingingCharacter.comida;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Categorías" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
        ListTile(
          title: const Text('Comida', style: TextStyle(fontSize: 17),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.comida,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Bebida', style: TextStyle(fontSize: 17),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.bebida,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Área de estudio', style: TextStyle(fontSize: 17),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.areaDeEstudio,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Zona Wifi', style: TextStyle(fontSize: 17),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.zonaWifi,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Deportes', style: TextStyle(fontSize: 17),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.deportes,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Sala de computo', style: TextStyle(fontSize: 17),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.salaDeComputo,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Container(
          color: Colors.green,
              width: 150,
              height: 50,
     child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
          onPressed: () {
          },
          child: Text('Buscar', style: TextStyle(fontSize: 20),),
        ),
        ),
      ],
    );
  }
}

