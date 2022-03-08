import 'package:flutter/material.dart';
import 'package:geoudea/ui/home.dart';

import '../bloc/login_bloc.dart';
import '../models/result.dart';

class RegisterPage extends StatefulWidget{
  static String id = "login_page";

  @override
  RegistersPage createState() => RegistersPage();
}


class RegistersPage extends State<RegisterPage>{
  final LoginBloc bloc=LoginBloc();
  String _email="";
  String _password="";
  String _repeatPassword="";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title:Text("Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Correo electronico"),
              onChanged: (value){
                _email=value;
              },
            ),
            TextField(
              obscureText: true,
              onChanged: (value){
                _password=value;
              },
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            TextField(
              obscureText: true,
              onChanged: (value){
                _repeatPassword=value;
              },
              decoration: InputDecoration(labelText: "Contraseña"),
            ),
            SizedBox(height: 20,),
            _bottomRegister(),
          ],
        ),

      ),

    );
  }

  _bottomRegister() {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return RaisedButton(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text("Registrarse",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                elevation: 10,
                color: Colors.green,
                onPressed: (){
                  signUp(_email, _password);
                }
            );

          }
      ),
    );
  }
  void signUp(String email, String password) {
    bloc.signUp(email, password).then((value) {
      if(value.status==Status.success){
        print("asd");
        goToHomePage();
      }
    });
  }
  void goToHomePage() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Home()),
      ModalRoute.withName('/'),
    );
  }
}