//class to retrieve data from server and or local storage.
import 'package:http/http.dart';
import 'dart:convert';

class userData {
  List<inventoryItem> inventoryData;

  Future<void> loadData() async {
    //temporarily creating data
    Response response = await get('http://82.75.109.169/get_data.php?food_id=22');
    List response_data = jsonDecode(response.body);
    Map data = response_data[0];
    print(data.runtimeType);
    print(data['food_id'].runtimeType);
    inventoryData = [
      inventoryItem(id: data['food_id'], name: data['name'], value: data['mass'], unit: data['unit']),
    ];
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
