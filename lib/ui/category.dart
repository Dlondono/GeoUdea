import 'package:flutter/material.dart';
import 'package:geoudea/ui/home.dart';
import 'package:geoudea/ui/map.dart';


class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
          child: const MyStatefulWidget(),
        );
  }
}

enum SingingCharacter {comida, areaDeEstudio, bloques, deportes, salaDeComputo}

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
        const Padding(
          padding: EdgeInsets.only(left: 30.0,top: 32.0),
          child: Text("Categorías" , style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
        ),
        ListTile(
          title: const Text('Cafeteria', style: TextStyle(fontSize: 17),),
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
          title: const Text('Bloques', style: TextStyle(fontSize: 17),),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.bloques,
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
            onChanged: (value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30.0,top: 16.0),
          child: Container(
            color: Colors.green,
                width: 150,
                height: 50,
               child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {
                 print(_character!.name);
                      _selectedCategoryToMap();

            },
                child: const Text('Buscar', style: const TextStyle(fontSize: 20),),
          ),
          ),
        ),
      ],
    );
  }

  void _selectedCategoryToMap() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => Home(category: _character!.name,))
    );
  }
}

