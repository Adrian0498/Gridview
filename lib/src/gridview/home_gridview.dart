import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeGridview extends StatefulWidget {
  @override
  _HomeGridviewState createState() => _HomeGridviewState();
}

class _HomeGridviewState extends State<HomeGridview> {
  int imgfinal = 0;

  List<int> imagenes = [];

  final ScrollController _controller = new ScrollController();
  var _final = false;

  _listener() {
    final maxScroll = _controller.position.maxScrollExtent;
    final minScroll = _controller.position.minScrollExtent;

    if (_controller.offset >= maxScroll) {
      setState(() {
        _final = true;
      });
    }

    if (_controller.offset <= minScroll) {
      setState(() {
        _final = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_listener);
    agregarElementos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria de Imagenes'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: galeria(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_circle),
        backgroundColor: _final ? Colors.orange : Colors.grey,
        onPressed: _final
            ? () {
                agregarElementos();
                setState(() {});
              }
            : null,
      ),
    );
  }

  Widget galeria() {
    return RefreshIndicator(
      onRefresh: getNewImages,
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: imagenes.length,
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'detalle',
                  arguments: imagenes[index]);
            },
            child: Hero(
              tag: imagenes[index],
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: index.isEven ? 200 : 240,
                    child: FadeInImage(
                      placeholder: AssetImage('assets/loading.gif'),
                      image: NetworkImage(
                          'https://picsum.photos/500/300/?image=${imagenes[index]}'),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 20.0,
      ),
    );
  }

  Future<Null> getNewImages() {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      imagenes.clear();
      imgfinal++;
      agregarElementos();
    });
    return Future.delayed(duration);
  }

  void agregarElementos() {
    for (var i = 0; i < 15; i++) {
      imgfinal++;
      imagenes.add(imgfinal);
      setState(() {});
    }
  }
}
