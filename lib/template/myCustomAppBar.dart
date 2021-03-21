import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //Passing trough all information
  String Title; //Name displayed in appbar
  Color secondaryColor; //Color of the widgets and text in the appbar
  Widget leadingButton;
  Function onLeadingPressed;
  Function getLeadingButton;
  Function getTitle;
  bool leadingIsVariable;

  CustomAppBar({
    Key key,
    this.Title: "Fooddrawer",
    this.onLeadingPressed,
    this.secondaryColor = Colors.white,
    this.leadingButton = null,
    this.getLeadingButton = null,
    this.getTitle = null,
  })  : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key) {

  }

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState(
      Title: Title,
      secondaryColor: secondaryColor,
      leadingButton: leadingButton,
      getLeadingButton: getLeadingButton,
      getTitle: getTitle,
  );
}

class _CustomAppBarState extends State<CustomAppBar> {
  userData instance;
  String Title;
  Color secondaryColor;
  Widget leadingButton;
  Function getLeadingButton;
  Function getTitle;

  _CustomAppBarState({
    this.Title,
    this.leadingButton,
    this.secondaryColor,
    this.getLeadingButton,
    this.getTitle,
  }) {}

  @override
  Widget build(BuildContext context) {
    //The actual custom appbar
    if (getLeadingButton != null) {
        leadingButton = getLeadingButton();
      }
    if (getTitle != null) {
      Title = getTitle();
    }

    return AppBar(
      leading: leadingButton,
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
