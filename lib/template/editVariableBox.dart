import 'package:flutter/material.dart';
import 'package:fooddrawer/services/getData.dart';
import 'package:fooddrawer/template/editVarPopup.dart';

class editVariableBox extends StatefulWidget {
  userData instance;
  String item_id;
  String varName;
  String varDisp;
  Function changeVarData;

  editVariableBox({
    this.instance,
    this.item_id,
    this.varName,
    this.varDisp = '',
    this.changeVarData,
  }) {
    if (varDisp == "") {
      varDisp = varName;
    }
  }

  @override
  _editVariableBoxState createState() => _editVariableBoxState(
        instance: instance,
        item_id: item_id,
        varName: varName,
        varDisp: varDisp,
        changeVarData: changeVarData,
      );
}

class _editVariableBoxState extends State<editVariableBox> {
  //passed trough variables
  userData instance;
  String item_id;
  String varName;
  String varDisp;
  Function changeVarData;

  //local settings
  inventoryItem inv_item;
  double min_height = 40;
  Color color = Colors.amber[400];

  _editVariableBoxState({
    this.instance,
    this.item_id,
    this.varName,
    this.varDisp,
    this.changeVarData,
  }) {}

  Future<void> onVarPressed(BuildContext context) async{
    //What happens when the variable gets pressed.

    editVarPopup editVarPop = editVarPopup(
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
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(color)),
      ),
    );
  }
}
