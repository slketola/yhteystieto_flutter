// ignore_for_file: prefer_const_constructors, avoid_print, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, dead_code, prefer_const_constructors_in_immutables

import 'package:faker/faker.dart';

import 'package:flutter/material.dart';

void main() => runApp(const ContactInformation());
int foija = 0;

class ContactInformation extends StatelessWidget {
  const ContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  List<Workers> starredWorkers = Workers.getStarredWorkers();
  late final List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
        itemCount: starredWorkers.length,
        itemBuilder: (BuildContext context, int index) {
          return createSavedContactObject(index);
        }),
    createContactObject(),
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

  createContactObject() {
    late final workers = Workers.getWorkers();
    var sort = false;
    var selectedColumn = 0;
    var selectedWorkers = [];

    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: DataTable(
          columns: [
            DataColumn(label: Text("Nimi")),
            DataColumn(label: Text("Yksikkö")),
            DataColumn(label: Text("Säpö")),
            DataColumn(label: Text("Kuva")),
            DataColumn(label: Text("Tähti")),
          ],
          rows: workers
              .map(
                (worker) =>
                    DataRow(selected: selectedWorkers.contains(worker), cells: [
                  DataCell(
                    Text(worker.name),
                  ),
                  DataCell(
                    Text(worker.unit),
                  ),
                  DataCell(
                    Text(worker.email),
                  ),
                  DataCell(
                    Text(worker.mobile),
                  ),
                  DataCell(
                    getIcon(worker.starred),
                  ),
                ]),
              )
              .toList(),
        ),
      )),
    );
  }

  getIcon(bool starred) {
    if (starred) {
      return Icon(
        Icons.star,
      );
    } else if (!starred) {
      return Icon(
        Icons.star_border,
      );
    }
  }

  createSavedContactObject(index) {
    return (Card(
      margin: const EdgeInsets.only(top: 20.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: <Widget>[
            Icon(Icons.person_2),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(starredWorkers[index].name),
                  Text(starredWorkers[index].email),
                  Text(starredWorkers[index].mobile)
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  children: <Widget>[Text("Taitamo")],
                ),
              ],
            ),
            Row(
              children: <Widget>[Icon(Icons.star)],
            )
          ],
        ),
      ),
    ));
  }
}

class Workers {
  String name;
  String unit;
  String email;
  String mobile;
  bool starred;

  Workers(
      {required this.name,
      required this.unit,
      required this.email,
      required this.mobile,
      required this.starred});

  static List<Workers> getWorkers() {
    return <Workers>[
      Workers(
          name: "Ahmo Micelanhc",
          unit: "Taitamo",
          email: 'taitamo@mail.com',
          mobile: '123456789',
          starred: true),
      Workers(
          name: "Shroc Croc",
          unit: "Luotsi",
          email: 'luotsi@mail.com',
          mobile: '123789456',
          starred: true),
      Workers(
          name: "Christoffer Wistoffer",
          unit: "TE-Toimisto",
          email: 'te@mail.com',
          mobile: '321654987',
          starred: false),
      Workers(
          name: "Liisa Järvinen",
          unit: "Luotsi",
          email: 'luotsi@mail.com',
          mobile: '123123123',
          starred: true),
    ];
  }

  static List<Workers> getStarredWorkers() {
    var allWorkers = getWorkers();
    allWorkers.removeWhere((item) => !item.starred);
    return allWorkers;
  }
}
