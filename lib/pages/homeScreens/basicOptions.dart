import 'package:flutter/material.dart';

class OptionsList extends StatefulWidget {
  //homeScreen page which list the quick settings
  OptionsList() {}

  @override
  _OptionsListState createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  _OptionsListState() {}

  //TODO add options to this screen
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: [
      Switch( //TODO make this switch work
        value: false,
        onChanged: (bool value) {
          print(value);
        },
      )
    ]);
  }
}
