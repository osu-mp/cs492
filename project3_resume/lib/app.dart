import 'package:flutter/material.dart';
import 'main_tabs.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project 3 - Call Me Matthew',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: MainTabs(),
    );
  }
  
}