import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoudea/ui/login_page.dart';
import 'package:geoudea/ui/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import '../bloc/login_bloc.dart';
import '../models/result.dart';
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
  final LoginBloc bloc=LoginBloc();
  FirebaseAuth auth=FirebaseAuth.instance;
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
             UserAccountsDrawerHeader(accountName: Text(""),
                accountEmail: Text(auth.currentUser!.email!),decoration:BoxDecoration(color: Colors.green) ),
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
              title: const Text("Horario"),
              leading: const Icon(Icons.calendar_today),
              selectedColor: Colors.green,
              selected: (3 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(3);
              },
            ),
            const Divider(),
            ListTile(
              title: const Text("Salir"),
              leading: const Icon(Icons.logout),
              selectedColor: Colors.green,
              selected: (4 == _selectDrawerItem),
              onTap: () {
                _onSelectItem(4);
              },
            ),
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
      case 4:
        title="Horario";
        signOut();
    }
  }

  _onSelectItem(int pos) {
    setState(() {
      _selectDrawerItem = pos;

      Navigator.of(context).pop();
    });
  }
  void signOut() {
    bloc.googleSignOut().then((value) {
      if(value.status==Status.success){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
            ModalRoute.withName('/'));
      }
    });
  }
}