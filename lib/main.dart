import 'package:flutter/material.dart'; //materials package
import 'package:fooddrawer/pages/loading.dart'; //importing pages
import 'package:fooddrawer/pages/home.dart';
import 'package:fooddrawer/pages/InventoryItemPage.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


void main() => runApp(MyApp()); //creates the application

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // this line is important
        RefreshLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('zh'),
      ],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        //print("change language");
        return locale;
      },
      theme: ThemeData(
        //setting theme data this data can be pulled from the context as following
        //Theme.of(context).primaryColor
        primaryColor: Colors.amber[600],
        accentColor: Colors.amber[400],
        //TODO add more theme data
      ),
      initialRoute: '/',
      routes: {
        //Routes are used to navigate between pages, and can be stacked on top of eachother
        //If a new page needs to be added the name of the route with the according widget has to be placed here such that the navigator can find it
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/inv_item': (context) => InventoryItemPage(),
      },
    );
  }
}
