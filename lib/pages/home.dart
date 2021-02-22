import 'package:flutter/material.dart'; //materials package
import 'package:fooddrawer/template/basic_elements.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color Primary_Color = Colors.amber[600];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fooddrawer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            tooltip: "Settings",
            onPressed: () { //open divider
              },
          ),
        ],
        backgroundColor: Primary_Color,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry A')),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry B')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              color: Colors.amber[100],
              child: const Center(child: Text('Entry C')),
            ),
          ),
        ],
      )
    );
  }
}
