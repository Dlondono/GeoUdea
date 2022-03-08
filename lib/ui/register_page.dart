import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  static String id = "login_page";

  @override
  RegistersPage createState() => RegistersPage();
}


class RegistersPage extends State<RegisterPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text("Pagina de Registro"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Nombres"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Apellidos"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Correo electronico"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Nombre de usuario"),
            ),
            TextField(
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