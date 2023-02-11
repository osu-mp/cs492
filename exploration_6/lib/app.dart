import 'package:flutter/material.dart';
import '../screens/main_screen.dart';
import 'screens/alpha_screen.dart';
import 'screens/beta_screen.dart';
import 'screens/chi_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exploration 6',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(title: 'Exploration 6'),
      // home: MainTabController(),
    );
  }

}

class MainTabController extends StatelessWidget {
  static const tabs = [
    Tab(text: 'Alpha'),
    Tab(text: 'Beta'),
    Tab(text: 'Chi'),
  ];

  final screens = [AlphaScreen(), BetaScreen(), ChiScreen()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Easy Tabs Example'),
            bottom: TabBar(tabs: tabs)
          ),
          body: TabBarView(children: screens)
        ));
  }
}
