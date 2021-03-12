import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FoodList extends StatefulWidget {
  Map data;

  FoodList({this.data});

  @override
  _FoodListState createState() => _FoodListState(data: data);
}

class _FoodListState extends State<FoodList> {
  Map data;
  userData instance;

  //initializer
  _FoodListState({
    this.data,
  });

  List<Widget> children;

  void getChildren() {
    children = [];
    instance = data["instance"];
    for (String food_id in instance.all_food_id) {
      children.add(foodItem(item_id: food_id, instance: instance));
    }
  }


  //TODO add refresh from refresh button
  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  Future<void> reloadData() async {
    instance.LoadHistoryData();
    await instance.LoadMainFoodData();
    setState(() => {});
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    await reloadData();
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    getChildren();
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: WaterDropHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: children,
      ),
    );
  }
}

class foodItem extends StatefulWidget {
  String item_id;
  userData instance;
  Color color = Colors.amber[400]; //temporarily setting color

  foodItem({this.item_id, this.instance});

  @override
  _foodItemState createState() =>
      _foodItemState(item_id: item_id, color: color, instance: instance);
}

class _foodItemState extends State<foodItem> {
  userData instance;
  String item_id;
  Color color;
  double min_height = 80;
  inventoryItem inv_item;

  _foodItemState({this.item_id, this.color, this.instance});

  void onPressedFoodItem() {
    Navigator.pushNamed(context, '/inv_item', arguments: {
      'name': "USERNAME",
      'item_id': item_id,
      'instance': instance,
    });
  }

  @override
  Widget build(BuildContext context) {
    inv_item = instance.inventoryData[item_id];
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
                    inv_item.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    inv_item.value + "  " + inv_item.unit,
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
