import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geoudea/ui/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'category.dart';
import 'recomendation.dart';
import 'calendar.dart';

class Home extends StatefulWidget {
  String? category;
  Home({this.category});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String title="GeoUdeA";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("GeoUdeA"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(accountName: Text("Pepe"),
                accountEmail: Text("pepe@udea.edu.co"),decoration:BoxDecoration(color: Colors.green) ),
            ListTile(
              title: const Text("Mapa"),
              leading: const Icon(Icons.map),
              selectedColor: Colors.green,
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: const Text("Categorias"),
              leading: const Icon(Icons.category),
              selectedColor: Colors.green,
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: const Text("Recomendaciones"),
              leading: const Icon(Icons.recommend),
              selectedColor: Colors.green,
              selected: (2 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              title: const Text("Calendario"),
              leading: const Icon(Icons.calendar_today),
              selectedColor: Colors.green,
              selected: (3 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),

            const Divider(),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }


  int _selectDrawerItem = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        title="Mapa";
        return Map(category: widget.category,);
      case 1:
        title="Categorias";
        return const Category();
      case 2:
        title="Recomendaciones";
        return Recomendation();
      case 3:
        title="Horario";
        return Calendar();
    }
  }

  _onSelectItem(int pos) {
    setState(() {
      _selectDrawerItem = pos;

      Navigator.of(context).pop();
    });
  }
}