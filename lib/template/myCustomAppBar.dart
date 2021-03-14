import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';

class LeadingButtons {
  Function onRefresh;
  Color secondaryColor;

  Widget Refresh;
  Widget Empty;
  Widget Back;
  Widget Space;

  LeadingButtons({
    this.onRefresh,
    this.secondaryColor = Colors.white,
  }) {
    Refresh = IconButton(
      onPressed: () => {onRefresh()},
      icon: Icon(
        Icons.refresh,
        color: secondaryColor,
      ),
    );
    Back = BackButton(
      color: secondaryColor,
    );
    Space = Opacity(
      opacity: 0.0,
      child: Icon(Icons.no_food),
    );
    Empty = null;
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //Passing trough all information
  String Title; //Name displayed in appbar
  Color secondaryColor; //Color of the widgets and text in the appbar
  Widget leadingButton;
  Function onLeadingPressed;
  Function getLeadingButton;
  bool leadingIsVariable;

  CustomAppBar({
    Key key,
    this.Title: "Fooddrawer",
    this.onLeadingPressed,
    this.secondaryColor = Colors.white,
    this.leadingButton = null,
    this.getLeadingButton = null,
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
      getLeadingButton: getLeadingButton
  );
}

class _CustomAppBarState extends State<CustomAppBar> {
  userData instance;
  String Title;
  Color secondaryColor;
  Widget leadingButton;
  Function getLeadingButton;

  _CustomAppBarState({
    this.Title,
    this.leadingButton,
    this.secondaryColor,
    this.getLeadingButton,
  }) {}

  @override
  Widget build(BuildContext context) {
    //The actual custom appbar
    if (getLeadingButton != null) {
        leadingButton = getLeadingButton();
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
