import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geoudea/ui/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'category.dart';
import 'recomendation.dart';
import 'calendar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("GeoUdea"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(accountName: Text("El pepe"),
                accountEmail: Text("elpepe@udeaa.edu.co")),
            ListTile(
              title: Text("Mapa"),
              leading: Icon(Icons.map),
              selected: (0 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              title: Text("Categorias"),
              leading: Icon(Icons.category),
              selected: (1 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            ListTile(
              title: Text("Recomendaciones"),
              leading: Icon(Icons.recommend),
              selected: (2 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(2);
              },
            ),
            ListTile(
              title: Text("Calendario"),
              leading: Icon(Icons.calendar_today),
              selected: (3 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),

            Divider(),
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
        return Map();
      case 1:
        return Category();
      case 2:
        return Recomendation();
      case 3:
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