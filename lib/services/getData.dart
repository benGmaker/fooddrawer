//class to retrieve data from server and or local storage.
import 'package:http/http.dart';
import 'dart:convert';

class userData {
  List inventoryData;
  List<String> all_food_id;
  Map HistoryFoodData;

  Future<void> LoadMainFoodData() async {
    Response response = //getting the data for main screen from server
    await get('http://82.75.109.169/get_data_all.php?user_id=1');
    //TODO make this work using session login instead of passing trough user id
    List data = jsonDecode(response.body); //decoding json file

    inventoryData = []; //setting the inventoryData to an empty list

    for (Map item in data) { //for each food item in the data create a new inventory item
      inventoryData.add(inventoryItem(
          id: item['food_id'],
          name: item['name'],
          value: item['mass'],
          unit: item['unit']));
    }
  }

  Future<void> LoadHistoryFoodData() async {
    if (inventoryData == null) { //if there is no inventory data this cannot be done
      //TODO make this a catch function
      return;
    }
    //TODO add get response which loads all history off food data
    for (inventoryItem item in inventoryData){
      int food_id = item.id;

    }
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
