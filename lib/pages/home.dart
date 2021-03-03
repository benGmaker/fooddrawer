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
  Map data = {};
  Color Primary_Color = Colors.amber[600];

  int _selectedIndex = 1;

  void _OnNavItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _children;

  void getChilderen() {
    _children = [
      PlaceholderWidget(Colors.deepOrange),
      FoodList(data),
      PlaceholderWidget(Colors.green),
    ];
  }

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
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    getChilderen(); //retrieves current state of children

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
