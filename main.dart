import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parking Locator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: Text('Parking Locator')),
        body: new FlutterMap(
            options: new MapOptions(
                center: new LatLng(-20.2413972, 57.4848256 ),  minZoom: 15.0),
            layers: [
              new TileLayerOptions(
                  urlTemplate:
                  "https://api.mapbox.com/styles/v1/avee11699/ckmaavnnf1t3g17qlrmt2kd1h/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYXZlZTExNjk5IiwiYSI6ImNrbG01cHBycTA2MWUycW4xbTVyNGFmcDMifQ.7I8iIIK6EP1W7TlXg98Zgg",
                  additionalOptions: {
                    'accessToken': 'pk.eyJ1IjoiYXZlZTExNjk5IiwiYSI6ImNrbG01cHBycTA2MWUycW4xbTVyNGFmcDMifQ.7I8iIIK6EP1W7TlXg98Zgg',
                    'id': 'mapbox.mapbox-streets-v8'
                    //'id': 'avee11699.8jx4vhln'
                  }
              ),
              new MarkerLayerOptions(markers: [
                new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(-20.247235, 57.490531 ),
                    builder: (context) =>
                    new Container(
                      child: IconButton(
                        icon: Icon(Icons.people),
                        color: Colors.green,
                        iconSize: 25,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    ))
              ]),
            ]));
  }
}