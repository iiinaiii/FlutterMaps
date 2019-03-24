import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  int _selectedIndex = 0;

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
            icon: SvgPicture.asset(
              'images/mapbox.svg',
              semanticsLabel: "Mapbox logo",
              width: 24,
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              'images/mapbox.svg',
              semanticsLabel: "Mapbox logo",
              width: 24,
              height: 24,
            ),
            title: Text('Map Box'),
          ),
        ],
        currentIndex: _selectedIndex,
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
