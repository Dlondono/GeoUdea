import 'package:flutter/material.dart';
import 'package:geoudea/bloc/reco_bloc.dart';
import 'package:geoudea/ui/home.dart';
import 'package:geoudea/ui/recomendation.dart';

class AggRecomendation extends StatefulWidget {
  const AggRecomendation({Key? key}) : super(key: key);

  @override
  _AggRecomendationState createState() => _AggRecomendationState();
}

class _AggRecomendationState extends State<AggRecomendation> {
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _contenidoController = TextEditingController();
  final GlobalKey<FormState> _formularioKey = GlobalKey<FormState>();
  RecoBloc recoBloc=RecoBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formularioKey,
          child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 40.0,top: 32.0),
              child: Text("Agregar Recomendaciones" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.0,top: 32.0),
            ),
            TextFormField(
              controller: _tituloController,
              maxLength: 30,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Titulo"
              ),
              validator: (String? dato){
                if (dato!.isEmpty){
                  return "Este campo es requerido";
                }
              }

            ),
        TextFormField(
        controller: _contenidoController,
        maxLength: 200,
        maxLines: 5,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
            labelText: "Descripción"
          ),
          validator: (String? dato){
            if (dato!.isEmpty){
              return "Este campo es requerido";
            }
          }
        ),

            Padding(
              padding: const EdgeInsets.only(left: 90.0,top: 36.0),
              child: Container(
                color: Colors.green,
                width: 200,
                height: 50,
                child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    recoBloc.addReco(_tituloController.text, _contenidoController.text);
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => Recomendation())
                    );
                  },
                  child: const Text('Agregar Recomendación', style: const TextStyle(fontSize: 15),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0,top: 36.0),
              child: Container(
                color: Colors.green,
                width: 200,
                height: 50,
                child:  ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
                  onPressed: () {
                    /*  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (BuildContext context) => Recomendation())
                    );*/
                  },
                  child: const Text('Regresar', style: const TextStyle(fontSize: 15),),
                ),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}
