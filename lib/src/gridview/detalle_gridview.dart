import 'package:flutter/material.dart';

class DetalleGridview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final numero = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalle de la Imagen'),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Hero(
            tag: numero,
            child: Container(
              height: 240,
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/500/300/?image=$numero'),
              ),
            ),
          )
        ],
      )),
    );
  }
}
