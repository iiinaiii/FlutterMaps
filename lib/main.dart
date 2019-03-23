import 'package:flutter/material.dart';

import 'google_maps_page.dart';
import 'map_box_page.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatefulWidget {
  @override
  State createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int _selectedIndex = 1;

  final _widgetOptions = [
    GoogleMapsPage(),
    MapBoxPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterMaps'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Google Maps'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Map Box'),
          ),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
