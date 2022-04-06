import 'package:flutter/material.dart';


import 'ui/splash_page.dart';

class GeoUdeaApp extends StatelessWidget {
  const GeoUdeaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.white,
      ),
      home: SplashPage(),
    );
  }
}
