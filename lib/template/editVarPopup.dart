import 'package:fooddrawer/services/getData.dart';
import 'package:flutter/material.dart';

class editVarPopup {
  Function setState;
  String valueText;
  String item_id;
  Function changeVarData;
  Function pushUpdate;

  editVarPopup({
    this.item_id,
    this.changeVarData,
    this.pushUpdate,
    this.setState,
  }) {
    textFieldController = TextEditingController();
  }

  Future<void> changeData(context) async {
    changeVarData(item_id, valueText);
    pushUpdate();
  }

  TextEditingController textFieldController;

  Widget display(BuildContext context) {
    return AlertDialog(
      title: Text('TextField in Dialog'),
      content: TextField(
        onChanged: (value) {
          setState(() {
            valueText = value;
          });
        },
        controller: textFieldController,
        decoration: InputDecoration(hintText: "Text Field in Dialog"),
      ),
      actions: <Widget>[
        FlatButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text('CANCEL'),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
        FlatButton(
          color: Colors.green,
          textColor: Colors.white,
          child: Text('OK'),
          onPressed: ()  {
            changeData(context);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
