import 'package:flutter/material.dart'; //materials package
import 'package:fooddrawer/pages/loading.dart'; //importing pages
import 'package:fooddrawer/pages/home.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
    }
));


