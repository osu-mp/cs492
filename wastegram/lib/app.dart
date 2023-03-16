import 'package:flutter/material.dart';
import 'package:wastegram/screens/single_entry_summary.dart';
import 'package:wastegram/screens/waste_list_screen.dart';
import 'screens/waste_detail_entry.dart';
import 'widgets/new_entry_button.dart';

class WastegramApp extends StatefulWidget {

  final routes = {
    FoodWasteListScreen.routeName: (context) => FoodWasteListScreen(),
    WasteDetailEntry.routeName: (context) => WasteDetailEntry(),
    SingleEntrySummary.routeName: (context) => SingleEntrySummary(),
  };

  WastegramApp({Key? key}) : super(key: key){}

  @override
  State<WastegramApp> createState() => _WastegramAppState();
}

class _WastegramAppState extends State<WastegramApp> {

  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wastegram',
      routes: widget.routes,

      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wastegram'),
          centerTitle: true,
        ),

        bottomNavigationBar: NewEntryButton(),
      ),
      initialRoute:  FoodWasteListScreen.routeName,
    );
  }
}
