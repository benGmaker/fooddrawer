//class to retrieve data from server and or local storage.
import 'package:http/http.dart';
import 'dart:convert';

class userData {
  List inventoryData;
  List<String> all_food_id;

  Future<void> loadData() async {
    Response response = await get('http://82.75.109.169/get_food.php?user_id=2');
    List food_data = jsonDecode(response.body);
    if (food_data.length == 0){
      return; //in the case that there is no food the function ends here
    }
    all_food_id = [];
    inventoryData = [];

    //List food = [22, 22, 11, 22, 22];
    var future_inventoryData = <Future>[];
    for (Map food_id_map in food_data) {
      String food_id = food_id_map['food_id']; //converting the food id map to a food id string
      all_food_id.add(food_id); //adding food id to the list

      future_inventoryData.add(get_InventoryItem(food_id));
    }

    inventoryData = await Future.wait(
        future_inventoryData); //waiting for all inventory data to be loaded
  }

  Future<inventoryItem> get_InventoryItem(String food_id) async {
    Response response = await get('http://82.75.109.169/get_data.php?food_id=$food_id');
    List response_data = jsonDecode(response.body);
    if (response_data.length == 0) {
      return inventoryItem();
    }
    Map data = response_data[0];
    return inventoryItem(
        id: data['food_id'],
        name: data['name'],
        value: data['mass'],
        unit: data['unit']
    );
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
