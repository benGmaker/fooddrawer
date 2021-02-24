import 'package:flutter/material.dart'; //materials package
import 'package:fooddrawer/pages/loading.dart'; //importing pages
import 'package:fooddrawer/pages/home.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
      },

    );
  }
}
