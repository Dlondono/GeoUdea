import 'package:flutter/material.dart';

class Information extends StatefulWidget {
  String title;
  String description;
  String products;
  Information({required this.title,required this.description,required this.products});
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0,top: 32.0),
                  child: Text("Información del sitio" , style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 40.0,top: 32.0),
              ),
              ListTile(
                title:
              Text(widget.title),
              subtitle:
              Text(widget.description + '\n' + widget.products),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
