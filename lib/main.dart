import 'dart:ffi';
import 'package:http/http.dart' as http;


import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home(key: null)));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yhteystieto-App',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                        Expanded(child: getImage()),
                  const Expanded(child: Text("Etunimi Sukunimi")),
                  const Expanded(child: Text("Taitamo")),
                  const Expanded(child: Text("+358 444 666 777")),
                        Expanded(child: IconButton(onPressed:(){print("object");},
                  icon: const Icon(Icons.star),
                  color: Colors.orange,
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[600],
        child: const Text('Click'),
      ),
    );
  }
}
Image getImage() {
    Image image = Image.network(
        'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif');
    return image;
  }

  String getName() {
    String name = "";
    return name;
  }

  String getUnit() {
    String unit = "";
    return unit;
  }

Future<http.Response> fetchPost() {  
  return http.get('https://jsonplaceholder.typicode.com/posts/1' as Uri);  
}

class Post {  
  final int userId;  
  final int id;  
  final String title;  
  final String body;  
  
  Post({this.userId, this.id, this.title, this.description});  
  
  factory Post.fromJson(Map<String, dynamic> json) {  
    return Post(  
      userId: json['userId'],  
      id: json['id'],  
      title: json['title'],  
      description: json['description'],  
    );  
  }  
}  