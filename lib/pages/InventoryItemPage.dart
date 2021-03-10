import 'package:flutter/material.dart';
import 'package:fooddrawer/template/basic_elements.dart';
import 'package:fooddrawer/services/getData.dart';

class InventoryItemPage
    extends StatefulWidget {
  @override
  _InventoryItemPageState createState() => _InventoryItemPageState();
}

class _InventoryItemPageState extends State<InventoryItemPage>{
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    inventoryItem inv_item = data['item_data'];

    return Scaffold(
      appBar: CustomAppBar(Title: inv_item.name),
      body: Text(
        inv_item.name,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}


