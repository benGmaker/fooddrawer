import 'package:flutter/material.dart'; //materials package
import 'package:fooddrawer/template/basic_elements.dart';
import 'package:fooddrawer/pages/homeScreens/basicOptions.dart';
import 'package:fooddrawer/pages/homeScreens/foodList.dart';
import 'package:fooddrawer/pages/homeScreens/ShoppingList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color Primary_Color = Colors.amber[600];

  int _selectedIndex = 1;
  void _OnNavItemTaped(int index) {
    setState(() {_selectedIndex = index;});
  }

  final List<Widget> _children = [
    PlaceholderWidget(Colors.deepOrange),
    FoodList(),
    PlaceholderWidget(Colors.green),
  ];

  final List<BottomNavigationBarItem> navBarItems = const <BottomNavigationBarItem>[
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
    return Scaffold(
      appBar: CustomAppBar(Primary_Color: Primary_Color),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
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





