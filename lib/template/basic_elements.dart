import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  //Passing trough all information
  String Title;
  String LeadingType;
  ScrollController scrollController;
  CustomAppBar({Key key,
    this.Title: "Fooddrawer",
    this.LeadingType = "Empty",
    this.scrollController,
  })
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState(Title: Title, LeadingType: LeadingType, scrollController: scrollController);
}

class _CustomAppBarState extends State<CustomAppBar> {
  userData instance;
  String Title;
  String LeadingType;
  Color secondaryColor;
  ScrollController scrollController;
  Map leadingButton;
  
  _CustomAppBarState({
    this.Title,
    this.LeadingType,
    this.scrollController,
    this.secondaryColor = Colors.white,
  }) {
    leadingButton = {
      "Refresh": IconButton(
        onPressed: () => {ScrollReload()},
        icon: Icon(
          Icons.refresh,
          color: secondaryColor,
        ),
      ),
      "Back": BackButton(
        color: secondaryColor,
      ),
      "Space": Opacity(
        opacity: 0.0,
        child: Icon(Icons.no_food),
      ),
      "Empty": null,
    };
  }

  Future<void> ScrollReload() async {
    //TODO set a pretier curve for this animation
    scrollController.animateTo(-120, duration: Duration(milliseconds: 400), curve: Curves.easeOutExpo);
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
