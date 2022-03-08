import 'dart:ffi';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  static String id = "login_page";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
              child: Icon(
                Icons.location_on,
                color: Colors.green,
                size: 180.0,
              ),
              ),
              /*Image.asset('lib/ui/image/logo1.png',
                height: 200,
              ),*/
              Text("GeoUdeA", style: TextStyle(fontSize: 40, color: Colors.black87,),),
              SizedBox(height: 15,),
              _userTextField(),
              SizedBox(height: 15,),
              _passwordTextField(),
              SizedBox(height: 20,),
              _bottomLogin(),
              SizedBox(height: 20,),
              _register(),


            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
      return StreamBuilder(
          builder: (BuildContext context, AsyncSnapshot snapshot){
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: "ejemplo@correo.com",
                  labelText: "Correo electronico",
                ),
                onChanged: (value){

                },
              ),
            );

      }
      );
  }
  Widget _passwordTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.lock),
                hintText: "Contraseña",
                labelText: "Contraseña",
              ),
              onChanged: (value){

              },

            ),
          );

        }
    );

  }

 Widget _bottomLogin() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot){
          return RaisedButton(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              child: Text("Inicar Sesión",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              elevation: 10,
              color: Colors.green,
              onPressed: (){}
          );
          
        }
    );

  }

  _register() {
    return StreamBuilder(
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
              onPressed: (){}
          );

        }
    );
  }

}