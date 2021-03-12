import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //Passing trough all information
  String Title;
  String LeadingType;
  Function onLeadingPressed;
  CustomAppBar({Key key,
    this.Title: "Fooddrawer",
    this.LeadingType = "Empty",
    this.onLeadingPressed,
  })
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState(Title: Title, LeadingType: LeadingType, onLeadingPressed: onLeadingPressed);
}

class _CustomAppBarState extends State<CustomAppBar> {
  userData instance;
  String Title;
  String LeadingType;
  Color secondaryColor = Colors.white;
  Function onLeadingPressed;
  Map leadingButton;



  _CustomAppBarState({
    this.Title,
    this.LeadingType,
    this.onLeadingPressed,
  }) {
    leadingButton = {
      "Refresh": IconButton(
        onPressed: () => setState((){onLeadingPressed();}),
        icon: Icon(
          Icons.refresh,
          color: secondaryColor,
        ),
      ),
      "Back": BackButton(
        color: secondaryColor,
      ),
      "Empty": null,
    };
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
