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
  Function parentPushUpdate;

  _InventoryItemPageState() {
    scrollController = ScrollController();
  }

  Future<void> getHistoryData() async {}

  List<Widget> children;

  void getChildren() {
    InvItemPageData invItemPageData =InvItemPageData(
      instance: instance,
      item_id: item_id,
      pushUpdate: pushUpdate,
    );
    children = [
      editVariableBox(
        invItemPageData: invItemPageData,
        varName: "Name",
        getVarValue: () {return item_data.name;},
        changeVarData: instance.set_name,
      ),
      editVariableBox(
        invItemPageData: invItemPageData,
        varName: "Experiation",
        getVarValue: () {return "(14-3-2021)";},
        changeVarData: () => {},
      ),
      editVariableBox(
        invItemPageData: invItemPageData,
        varName: "Unit",
        getVarValue: () {return item_data.unit;},
        changeVarData: instance.set_unit,
      ),
    ];
  }

  void pushUpdate() {
    this.setState(() {
      getData(context);
      parentPushUpdate();
    });
  }

  void getData(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    instance = data['instance'];
    item_id = data['item_id'];
    parentPushUpdate = data['pushUpdate'];
    item_data = instance.inventoryData[item_id];
  }

  String getTitle() {
    return item_data.name;
  }

  @override
  Widget build(BuildContext context) {
    getData(context);
    print(item_data.name);
    //example how to change the data, this gets updated for the whole application
    //instance.inventoryData[item_id].name = "wow";
    Widget leadingButton = leadingButtons().Back(); //getting leading button template
    CustomAppBar myAppbar = CustomAppBar( //updating the appbar
      getTitle: () {return item_data.name;},
      leadingButton: leadingButton,
    );
    getChildren(); //update children

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
