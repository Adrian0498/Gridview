import 'package:app_fotos/src/gridview/detalle_gridview.dart';
import 'package:app_fotos/src/gridview/home_gridview.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeGridview(),
        'detalle': (BuildContext context) => DetalleGridview()
      },
    );
  }
}
