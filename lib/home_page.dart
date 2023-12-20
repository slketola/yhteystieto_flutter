// ignore_for_file: prefer_const_constructors, avoid_print, no_leading_underscores_for_local_identifiers

import 'package:faker/faker.dart';

import 'package:flutter/material.dart';

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
  static final List<Widget> _widgetOptions = <Widget>[
    Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(18, 5, 0, 0),
      child: Text("No Saved Contacts"),
    )),
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
                      Expanded(child: Text(initializeContact(1))),
                      Expanded(child: Text("Taitamo")),
                      Expanded(child: Text(initializeContact(0))),
                      Expanded(
                          child: IconButton(
                        onPressed: () {
                          print("object");
                        },
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

initializeContact(index) {
  late final _faker = Faker();
  String firstName = _faker.person.firstName();
  String lastName = _faker.person.lastName();
  String name = "$firstName $lastName";
  String mobile = _faker.phoneNumber.us();
  if (index == 1) {
    return name;
  } else if (index == 0) {
    return mobile;
  }
}
