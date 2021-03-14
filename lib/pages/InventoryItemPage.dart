import 'package:flutter/material.dart';
import 'package:fooddrawer/template/myCustomAppBar.dart';
import 'package:fooddrawer/services/getData.dart';
import 'package:fooddrawer/template/leadingButton.dart';
import 'package:fooddrawer/template/editVariableBox.dart';

class InventoryItemPage extends StatefulWidget {
  //Page to view an inventory item with more detail
  @override
  _InventoryItemPageState createState() => _InventoryItemPageState();
}

class _InventoryItemPageState extends State<InventoryItemPage> {
  userData instance;
  Map data = {};
  String item_id;
  inventoryItem item_data;
  ScrollController scrollController;

  _InventoryItemPageState() {
    scrollController = ScrollController();


  }

  Future<void> getHistoryData() async {}

  List<Widget> children;
  void getChildren() {
    children = [
      editVariableBox(instance: instance, item_id: item_id, varName: "Name", varDisp: item_data.name),
      editVariableBox(instance: instance, item_id: item_id, varName: "Experiation", varDisp: "(14-3-2021)"),
      editVariableBox(instance: instance, item_id: item_id, varName: "Unit", varDisp: item_data.unit),

    ];
  }

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    instance = data['instance'];
    item_id = data['item_id'];
    item_data = instance.inventoryData[item_id];

    //example how to change the data, this gets updated for the whole application
    //instance.inventoryData[item_id].name = "wow";
    Widget leadingButton = leadingButtons().Back();
    CustomAppBar myAppbar = CustomAppBar(
      Title: item_data.name,
      leadingButton: leadingButton,
    );
    getChildren();

    return Scaffold(

      appBar: myAppbar,
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: children,
        controller: scrollController,
      ),
    );
  }
}


