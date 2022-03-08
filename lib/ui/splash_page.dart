import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geoudea/ui/home.dart';
import 'package:geoudea/ui/login_page.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  FirebaseAuth auth =FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verifyAuth();
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
  void verifyAuth() async {
    Future.delayed(
      Duration(seconds: 1),
          () {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => Home()));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => LoginPage()));
        }
      },
    );
  }
}
