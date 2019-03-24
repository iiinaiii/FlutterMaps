import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class MapBoxPage extends StatefulWidget {
  @override
  _MapBoxPageState createState() => _MapBoxPageState();
}

class _MapBoxPageState extends State<MapBoxPage> {
  MapboxMapController controller;

  void _onMapViewCreated(MapboxMapController controller) {
    this.controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MapboxMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(35.6580339, 139.7016358),
        ),
        onMapCreated: _onMapViewCreated,
        onMapClick: (point, coords) async {
          List ls = await controller.queryRenderedFeatures(
              point, ['LayerName'], null);
          print("queryRenderedFeatures test $ls");
        },
      ),
    );
  }
}
