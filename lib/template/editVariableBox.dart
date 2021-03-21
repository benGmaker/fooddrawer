import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';
import 'package:fooddrawer/template/editVarPopup.dart';

class InvItemPageData {
  //class for storing inventory Item page data. The data which is stored in here is the same for each editVariableBox
  userData instance;
  String item_id;
  Function pushUpdate;
  InvItemPageData({
    this.instance,
    this.item_id,
    this.pushUpdate,
  });
}

class editVariableBox extends StatefulWidget {
  InvItemPageData invItemPageData;
  String varName;
  Function changeVarData;
  Function getVarValue;

  editVariableBox({
    this.invItemPageData,
    this.getVarValue,
    this.varName,
    this.changeVarData,
  }) {
  }

  @override
  _editVariableBoxState createState() => _editVariableBoxState(
        getVarValue: getVarValue,
        varName: varName,
        changeVarData: changeVarData,
        invItemPageData: invItemPageData,
      );
}

class _editVariableBoxState extends State<editVariableBox> {
  //passed trough variables
  userData instance;
  String item_id;
  String varName;
  String varDisp;
  Function changeVarData;
  Function parentPushUpdate;
  Function getVarValue;
  InvItemPageData invItemPageData;

  //local settings
  inventoryItem inv_item;
  double min_height = 40;
  Color color = Colors.amber[400];

  _editVariableBoxState({
    this.varName,
    this.getVarValue,
    this.changeVarData,
    this.invItemPageData,
  }) {
    item_id = invItemPageData.item_id;
    instance = invItemPageData.instance;
}

  void pushUpdate() {
    setState(() {
      invItemPageData.pushUpdate();
    });
  }



  Future<void> onVarPressed(BuildContext context) async {
    //What happens when the variable gets pressed.

    editVarPopup editVarPop = editVarPopup(
      pushUpdate: pushUpdate,
      setState: setState,
      changeVarData: changeVarData,
      item_id: item_id,
    );
    return showDialog(
      context: context,
      builder: editVarPop.display,
    );
  }

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    inv_item = instance.inventoryData[item_id];
    varDisp = getVarValue();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: ElevatedButton(
        onPressed: () => {onVarPressed(context)},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //starting symbol or picture
            SizedBox(width: 0, height: min_height),
            //using a one dimension sized box to set the height of the item
            Text(
              varName + ": ",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    varDisp,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(),
                  ),
                  //TextField(

                  //obscureText: true,
                  //controller: _controller,
                  //decoration: InputDecoration(
                  // border: OutlineInputBorder(),
                  //  labelText: varDisp,
                  // ),
                  //),
                ],
              ),
            ),

            IconButton(
              //ending item
              icon: Icon(Icons.edit),
              color: Colors.white,
              onPressed: () => onVarPressed(context),
            ),
          ],
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color)),
      ),
    );
  }
}
