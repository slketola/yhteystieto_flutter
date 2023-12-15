import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:yhteistieto_app/constants.dart';

void main() => runApp(const ContactInformation());

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: Icon(Icons.person_2)),
                      Expanded(child: Text("Etunimi Sukunimi")),
                      Expanded(child: Text("Taitamo")),
                      Expanded(child: Text("+358 444 666 777")),
                      Expanded(
                          child: IconButton(
                              onPressed: (null), icon: Icon(Icons.star)))
                    ]),
              )
            ],
          )),
    ),
    Scaffold(
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: Icon(Icons.person_2)),
                      Expanded(child: Text("Etunimi Sukunimi")),
                      Expanded(child: Text("Taitamo")),
                      Expanded(child: Text("+358 444 666 777")),
                      Expanded(
                          child: IconButton(
                        onPressed: (null),
                        icon: Icon(Icons.star),
                        color: Colors.orange,
                      )),
                    ]),
              )
            ],
          )),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yhteystieto test'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined),
            label: 'Yhteystiedot',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
