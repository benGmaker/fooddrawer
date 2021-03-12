import 'package:flutter/material.dart';
import 'package:fooddrawer/template/basic_elements.dart';
import 'package:fooddrawer/services/getData.dart';

class InventoryItemPage extends StatefulWidget {
  //Page to view an inventory item with more detail
  @override
  _InventoryItemPageState createState() => _InventoryItemPageState();
}

class _InventoryItemPageState extends State<InventoryItemPage> {
  userData instance;
  Map data = {};
  inventoryItem item_data;

  _InventoryItemPageState() {}

  Future<void> getHistoryData() async {
  }

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    item_data = data['item_data'];



    return Scaffold(
      appBar: CustomAppBar(Title: item_data.name),
      body: Text(
        item_data.name,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
