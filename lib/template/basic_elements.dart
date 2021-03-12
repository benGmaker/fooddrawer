import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //Passing trough all information
  String Title;
  String LeadingType;
  CustomAppBar({Key key, this.Title: "Fooddrawer", this.LeadingType = "Empty"})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState(Title: Title, LeadingType: LeadingType);
}

class _CustomAppBarState extends State<CustomAppBar> {
  userData instance;
  String Title;
  String LeadingType;
  Color secondaryColor = Colors.white;
  Map leadingButton = {
    "Refresh": IconButton(
      onPressed: () {
      },
      icon: Icon(
          Icons.refresh,
        color:Colors.white,
      ),
    ),
    "Back": BackButton(
      color: Colors.white,
    ),
    "Empty": null,
  };


  _CustomAppBarState({this.Title, this.LeadingType}) {
  }


  @override
  Widget build(BuildContext context) {
    //The actual custom appbar
    return AppBar(
      leading: leadingButton[LeadingType],
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
