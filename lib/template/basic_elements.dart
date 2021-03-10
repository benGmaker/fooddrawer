import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //Passing trough all information
  String Title;
  bool HasBackButton;
  CustomAppBar({Key key, this.Title: "Fooddrawer", this.HasBackButton = true})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState(Title: Title, HasBackButton: HasBackButton);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String Title;
  bool HasBackButton;
  Color secondaryColor = Colors.white;
  var myBackButton;

  _CustomAppBarState({this.Title, this.HasBackButton}) {
    if (HasBackButton) {
      myBackButton = BackButton(
        color: secondaryColor,);
    };
  }


  @override
  Widget build(BuildContext context) {
    //The actual custom appbar
    return AppBar(
      leading: myBackButton,
      title: Text(
          Title,
          style: TextStyle(
              color: secondaryColor,
          ),
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.menu),
          tooltip: "Settings",
          color: secondaryColor,
          onPressed: () {
            //open divider
          },
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
