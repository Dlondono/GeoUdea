import 'package:flutter/material.dart';
import 'package:geoudea/ui/map.dart';

class GeoUdeaApp extends StatelessWidget {
  const GeoUdeaApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Map(category: "a"),
    );
  }
}
