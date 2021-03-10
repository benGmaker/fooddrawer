//class to retrieve data from server and or local storage.

import 'package:http/http.dart';
import 'dart:convert';

class userData {
  List inventoryData;
  List<String> all_food_id;
  Map HistoryData;

  Future<void> Login() async {
    //TODO implement login function with secure session
  }

  Future<void> LoadMainFoodData() async {
    Response response = //getting the data for main screen from server
        await get('http://82.75.109.169/get_data_all.php?user_id=1');
    //TODO make this work using session login instead of passing trough user id
    List data = jsonDecode(response.body); //decoding json file

    inventoryData = []; //setting the inventoryData to an empty list

    for (Map item in data) {
      //for each food item in the data create a new inventory item
      inventoryData.add(inventoryItem(
          id: item['food_id'], name: item['name'], value: item['mass'], unit: item['unit']));
    }
  }

  Future<void> LoadHistoryData() async {
    Response response = await get('http://82.75.109.169/get_data_range.php?user_id=1&days=10');
    await Future.delayed(const Duration(seconds: 20));
    HistoryData = jsonDecode(response.body);
    //TODO add get response which loads all history off food data

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
