import 'package:flutter/material.dart';
import 'package:fooddrawer/template/basic_elements.dart';
import 'package:fooddrawer/pages/homeScreens/basicOptions.dart';
import 'package:fooddrawer/pages/homeScreens/foodList.dart';
import 'package:fooddrawer/pages/homeScreens/ShoppingList.dart';
import 'package:fooddrawer/services/getData.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //state object of the Home screen
  Map data = {}; //empty map for the data to be stored in
  int _selectedIndex = 1; //index of the starting screen

  void _OnNavItemTaped(int index) {
    //This function is exectuded when the navigation bar is tapped
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _children; //List with homeScreen widgets

  void getChilderen() {
    //Builds or Rebuilds the widgets in the children list,
    _children = [
      OptionsList(),
      FoodList(data: data),
      PlaceholderWidget(Colors.green),
    ];
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
  Widget build(BuildContext context) { //the home screen widget builder
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    getChilderen(); //retreives current state of children

    return Scaffold(
      appBar: CustomAppBar(HasBackButton: false),
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
