import 'package:flutter/material.dart';
import 'main_tabs.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Exploration 6',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MainTabs(),
      // home: MainTabController(),
    );
  }
  
}