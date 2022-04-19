
import 'package:flutter/material.dart';
import 'package:geoudea/ui/agg_recomendation.dart';
import 'package:geoudea/ui/home.dart';

class Recomendation extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
    Padding(
    padding: EdgeInsets.only(left: 40.0,top: 32.0),
    child: Text("Lista de Recomendaciones" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
    ),
    Padding(
    padding: EdgeInsets.only(left: 1.0,top: 22.0),
    child: Container(
    child: ListTile(
    title: Text('when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', style: TextStyle(fontSize: 13),),
      leading: Icon(
        Icons.recommend,
        size: 35,
        color: Colors.lightGreen,
      ),

    ),
    ),
    ),
          Padding(
            padding: EdgeInsets.only(left: 1.0,top: 12.0),
            child: Container(
              child: ListTile(
                title: Text('when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', style: TextStyle(fontSize: 13),),
                leading: Icon(
                  Icons.recommend,
                  size: 35,
                  color: Colors.lightGreen,
                ),

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.0,top: 12.0),
            child: Container(
              child: ListTile(
                title: Text('when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', style: TextStyle(fontSize: 13),),
                leading: Icon(
                  Icons.recommend,
                  size: 35,
                  color: Colors.lightGreen,
                ),

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.0,top: 12.0),
            child: Container(
              child: ListTile(
                title: Text('when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', style: TextStyle(fontSize: 13),),
                leading: Icon(
                  Icons.recommend,
                  size: 35,
                  color: Colors.lightGreen,
                ),

              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 1.0,top: 12.0),
            child: Container(
              child: ListTile(
                title: Text('when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries', style: TextStyle(fontSize: 13),),
                leading: Icon(
                  Icons.recommend,
                  size: 35,
                  color: Colors.lightGreen,
                ),

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
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => AggRecomendation())
                    );
                    },
                child: const Text('Agregar Recomendación', style: const TextStyle(fontSize: 15),),
              ),
            ),
          ),
  ],

    );
  }
}
