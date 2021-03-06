
import 'package:flutter/material.dart';
import 'package:geoudea/bloc/reco_bloc.dart';
import 'package:geoudea/models/Appointment.dart';
import 'package:geoudea/ui/agg_recomendation.dart';
import 'package:geoudea/ui/home.dart';

class Recomendation extends StatefulWidget{
  @override
  State<Recomendation> createState() => _RecomendationState();
}

class _RecomendationState extends State<Recomendation> {
  RecoBloc bloc=RecoBloc();
  List<Recomendaciones> recomendaciones=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecomendaciones();
  }
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 50.0,top: 32.0),
              child: Text("Lista de Recomendaciones" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
            ),
            ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: recomendaciones.length,
                itemBuilder: (context, index){
                  return ListTile(title:
                      Text(recomendaciones[index].title!),
                      subtitle:
                      Text(recomendaciones[index].description!),

                  );
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
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => AggRecomendation())
                      );
                      },
                  child: const Text('Agregar Recomendaci??n', style: const TextStyle(fontSize: 15),),
                ),
              ),
            ),
  ],

      ),
    );
  }

  void getRecomendaciones()async {

    List<Recomendaciones> recos;
    recos=await bloc.getRecomendaciones();
    setState(() {
      recomendaciones=recos;
    });

  }
}
