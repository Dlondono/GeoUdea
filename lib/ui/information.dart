import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  const Information({Key? key}) : super(key: key);

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0,top: 32.0),
                child: Text("Información del sitio" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0,top: 32.0),
              ),
              TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Nombre del sitio"
                  ),
                  validator: (String? dato){
                    if (dato!.isEmpty){
                      return "Este campo es requerido";
                    }
                  }

              ),
              TextFormField(
                  maxLength: 30,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Informacion del sitio"
                  ),
                  validator: (String? dato){
                    if (dato!.isEmpty){
                      return "Este campo es requerido";
                    }
                  }

              ),
              TextFormField(
                  maxLength: 200,
                  maxLines: 5,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Descripción del sitio"
                  ),
                  validator: (String? dato){
                    if (dato!.isEmpty){
                      return "Este campo es requerido";
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
