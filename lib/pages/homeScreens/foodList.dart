import 'package:flutter/material.dart';
class FoodList extends StatefulWidget {
  Map data;

  FoodList(Map data) {
    this.data = data;
  }

  @override
  _FoodListState createState() => _FoodListState(data);
}

class _FoodListState extends State<FoodList> {
  Map data;
  _FoodListState(Map data) {
    this.data = data;
  }

  List<Widget> children;

  void getChildren() {
    children = [];
    for (var item in data["inventoryData"]) {
      children.add(
          foodItem(
            title: item.name,
            color: Colors.amber[400]
          )
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    getChildren();
    return   ListView(
      padding: const EdgeInsets.all(8),
      children: children,
    );
  }
}

class foodItem extends StatefulWidget {
  String title;
  Color color;
  foodItem({this.title, this.color});
  @override
  _foodItemState createState() => _foodItemState(title: title, color: color);
}

class _foodItemState extends State<foodItem> {
  String title;
  Color color;
  _foodItemState({this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        color: color,
        child: Center(child: Text(title)),
      ),
    );
  }
}

