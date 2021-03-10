import 'package:flutter/material.dart'; //materials package
import 'package:fooddrawer/pages/loading.dart'; //importing pages
import 'package:fooddrawer/pages/home.dart';
import 'package:fooddrawer/pages/InventoryItemPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(
          primaryColor: Colors.amber[600],
          accentColor: Colors.amber[400],
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/inv_item' : (context) => InventoryItemPage(),
      },
    );
  }
}
