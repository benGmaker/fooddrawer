import 'package:flutter/material.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //Passing trough all information
  Color Primary_Color = Colors.amber[600];
  CustomAppBar({Key key, this.Primary_Color}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState(Primary_Color: Primary_Color);
}

class _CustomAppBarState extends State<CustomAppBar> {
  Color Primary_Color;

  _CustomAppBarState({this.Primary_Color}){ //constructor
  }
  
  @override
  Widget build(BuildContext context) {//The actual custom appbar
    return AppBar(
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
    );
  }
}





