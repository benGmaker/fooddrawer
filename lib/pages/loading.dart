import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fooddrawer/services/getData.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    perform_login();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        )));
  }

  void perform_login() async {
    //function for retreving login data
    //temporarily a timer
    userData instance = userData();
    await instance.loadData();
    print(instance.inventoryData);

    await Future.delayed(
      // simulating login to server, waits to seconds to perform it
      Duration(seconds: 2),
      () => {},
    );
    //when the login is performed succesfully we go to the home screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'name': "USERNAME",
      'inventoryData': instance.inventoryData,
    });
  }
}
