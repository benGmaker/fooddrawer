import 'package:flutter/material.dart';
import 'package:fooddrawer/template/basic_elements.dart';

class ShoppingList extends StatefulWidget {
  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Color Primary_Color = Colors.amber[600];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Primary_Color: Primary_Color),


    );
  }
}
