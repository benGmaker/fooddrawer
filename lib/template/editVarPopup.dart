import 'package:fooddrawer/services/getData.dart';
import 'package:flutter/material.dart';

class editVarPopup {
  Function setState;

  editVarPopup({
    this.setState,
  }) {
    textFieldController = TextEditingController();
  }

  TextEditingController textFieldController;

  Widget display(BuildContext context) {
    return AlertDialog(
      title: Text('TextField in Dialog'),
      content: TextField(
        onChanged: (value) {
          setState(() {
            //valueText = value;
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
          onPressed: () {
            setState(() {
              //codeDialog = valueText;
              Navigator.pop(context);
            });
          },
        ),
      ],
    );
  }
}
