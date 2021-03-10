import 'package:flutter/material.dart';

class OptionsList extends StatefulWidget {
  OptionsList() {}

  @override
  _OptionsListState createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  _FoodListState(Map data) {}

  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(8), children: [
      Switch(
        value: false,
        onChanged: (bool value) {
          print(value);
        },
      )
    ]);
  }
}
