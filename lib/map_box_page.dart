import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapBoxPage extends StatefulWidget {
  @override
  _MapBoxPageState createState() => _MapBoxPageState();
}

class _MapBoxPageState extends State<MapBoxPage> {
  MapViewController controller;

  void _onMapViewCreated(MapViewController controller) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MapView(
        onMapViewCreated: _onMapViewCreated,
        onTap: (point, coords) async {
          List ls = await controller.queryRenderedFeatures(
              point, ['LayerName'], null);
          print("queryRenderedFeatures test $ls");
        },
      ),
    );
  }
}
