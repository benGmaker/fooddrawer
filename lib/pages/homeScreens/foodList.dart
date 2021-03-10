import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';

class FoodList extends StatefulWidget {
  Map data;
  FoodList({this.data});

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
      children.add(foodItem(item_data: item));
    }
  }

  @override
  Widget build(BuildContext context) {
    getChildren();
    return ListView(
      padding: const EdgeInsets.all(8),
      children: children,
    );
  }
}

class foodItem extends StatefulWidget {
  inventoryItem item_data;

  Color color = Colors.amber[400];//temporarily setting color, will be user setting

  foodItem({this.item_data});


  @override
  _foodItemState createState() =>
      _foodItemState(item_data: item_data, color: color);
}

class _foodItemState extends State<foodItem> {
  inventoryItem item_data;
  Color color;
  double min_height = 80;

  _foodItemState({this.item_data, this.color});
  void onPressedFoodItem() {
    print('Boomer heeft knopje gedrukt');
    Navigator.pushNamed(context, '/inv_item', arguments: {
      'name': "USERNAME",
      'item_data': item_data,
    });

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => {onPressedFoodItem()},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.fastfood_rounded),
            //starting symbol or picture
            SizedBox(width: 0, height: min_height),
            //using a one dimension sized box to set the height of the item
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    item_data.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item_data.value + "  " + item_data.unit,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(),
                  ),
                ],
              ),
            ),

            IconButton(
              //ending item
              icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: () => onPressedFoodItem(),
            ),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
      ),
    );
  }
}
