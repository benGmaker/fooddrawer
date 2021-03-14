import 'package:flutter/material.dart';
import 'package:fooddrawer/template/myCustomAppBar.dart';
import 'package:fooddrawer/pages/homeScreens/basicOptions.dart';
import 'package:fooddrawer/pages/homeScreens/foodList.dart';
import 'package:fooddrawer/pages/homeScreens/ShoppingList.dart';
import 'package:fooddrawer/services/getData.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:fooddrawer/template/leadingButton.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //state object of the Home screen
  Map data = {}; //empty map for the data to be stored in
  int _selectedIndex = 1; //index of the starting screen
  List<Widget> _LeadingButtons; //types of leading buttons per homepageScreen
  List<Widget> _children; //List with homeScreen widgets
  ScrollController scrollController; //scrollcontroller of the listview
  CustomAppBar myAppbar; //The appbar

  _HomeState() {
    leadingButtons LeadingButtons = leadingButtons();
    _LeadingButtons = [
      LeadingButtons.Space(),
      LeadingButtons.Refresh(ScrollReload),
      LeadingButtons.Space(),
    ]; //setting values of the leadingTypes
    scrollController = ScrollController(); //creating the scrollcontroller
  }

  void _OnNavItemTaped(int index) {
    //This function is exectuded when the navigation bar is tapped
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> ScrollReload() async {
    //Function that scrolls up to reload
    //TODO set a pretier curve for this animation
    scrollController.animateTo(-120,
        duration: Duration(milliseconds: 400), curve: Curves.easeOutExpo);
  }

  void getChilderen() {
    //Builds/Rebuilds the widgets in the children list,
    _children = [
      OptionsList(),
      FoodList(data: data, scrollController: scrollController),
      PlaceholderWidget(Colors.green),
    ];
  }

  Widget getLeadingButton() {
    //returns the current leading button widget
    return _LeadingButtons[_selectedIndex];
  }

  //List containing the widgets of the navigation bar
  final List<BottomNavigationBarItem> navBarItems =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Quick settings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fastfood),
      label: 'Inventory',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag),
      label: 'Shopping list',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //the home screen widget builder
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    getChilderen(); //retreives current state of children
    myAppbar = CustomAppBar(
      getLeadingButton: getLeadingButton,
    );

    return Scaffold(
      appBar: myAppbar,
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        onTap: _OnNavItemTaped,
      ),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
