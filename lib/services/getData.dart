//class to retrieve data from server and or local storage.
import 'package:http/http.dart';
import 'dart:convert';

class userData {
  List
  inventoryData;

  Future<void> loadData() async {
    inventoryData = [];
    //get the food id's
    List food = [22,22,11,22,22];
    var futureData = <Future>[];
    for (var food_id in food) {
      futureData.add(get_InventoryItem(food_id));
    }

    inventoryData = await Future.wait(futureData);


  }

  Future<inventoryItem> get_InventoryItem(int food_id) async {
    Response response = await get('http://82.75.109.169/get_data.php?food_id=$food_id');
    List response_data = jsonDecode(response.body);
    Map data = response_data[0];
    return inventoryItem(id: data['food_id'], name: data['name'], value: data['mass'], unit: data['unit']);
  }


}

class inventoryItem {
  String id;
  String name;
  String value;
  String unit;

//tumbnail

  inventoryItem({
    this.id,
    this.name,
    this.value,
    this.unit,
  }) {}


  String toString() {
    return "inventoryItem: [id: $id, name: $name, value: $value, unit: $unit]";
  }
}
