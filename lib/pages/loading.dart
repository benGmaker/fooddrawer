import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fooddrawer/services/getData.dart';

class Loading extends StatefulWidget {
  //Start loading screen of the application
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    perform_login(); //logs user in and loads data
  }

  @override
  Widget build(BuildContext context) {
    //TODO update loading screen to match style
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
          //loading icon
          color: Colors.white,
          size: 50.0,
        )));
  }

  void perform_login() async {
    //function for retrieving login data
    userData instance = userData();
    //loading all data is executed first but is not necessarily finished earlier than LoadMainData
    //This is because we don't wait on LoadAllData
    instance.LoadHistoryData();
    await instance.LoadMainFoodData();

    //when the login is performed succesfully we go to the home screen
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'name': "USERNAME",
      'instance': instance,
    });
  }
}
