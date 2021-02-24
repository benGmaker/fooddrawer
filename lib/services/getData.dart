//class to retrieve data from server and or local storage.
import 'package:fooddrawer/services/getData.dart';

class userData{
  List<inventoryItem> inventoryData;



  void loadData() {
    //temporarily creating data
    inventoryData = [
      inventoryItem(id: 1234, name: "Rice", value: 2400, unit: "g"),
      inventoryItem(id: 2345, name: "Grain", value: 2327, unit: "g"),
      inventoryItem(id: 5341, name: "Milk", value: 1.2, unit: "L"),
      inventoryItem(id: 5252, name: "Bread", value: 500, unit: "g"),
    ];
  }

}


class inventoryItem{
int id;
String name;
double value;
String unit;
//tumbnail

inventoryItem({
  this.id,
  this.name,
  this.value,
  this.unit,
}){}

  String toString() {
    return "inventoryItem: [id: $id, name: $name, value: $value, unit: $unit]";
  }


}
