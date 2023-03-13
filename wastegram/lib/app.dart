import 'package:flutter/material.dart';
import 'screens/waste_detail_entry.dart';
import 'widgets/new_entry_button.dart';

class WastegramApp extends StatefulWidget {
  // late final DatabaseManager dbManager;

  final routes = {
    WasteDetailEntry.routeName: (context) => WasteDetailEntry(),
  };

  WastegramApp({Key? key}) : super(key: key){
    // dbInit();
  }

  @override
  State<WastegramApp> createState() => _WastegramAppState();
}

class _WastegramAppState extends State<WastegramApp> {

  void initState(){
    super.initState();
    retrieveLocation();
  }

  void retrieveLocation() async {
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wastegram',
      routes: widget.routes,

      theme: ThemeData.dark(),
      home: Scaffold(
        // endDrawer: SettingsDrawer(
        //   initValue: darkMode,
        //   darkModeToggle: (bool value) {
        //     setState(() {
        //       widget.preferences.setBool(DARK_MODE_KEY, value);
        //     });
        //   },
        // ),
        appBar: AppBar(
          title: Text('Wastegram'),
          centerTitle: true,
          // actions: [
          //   Builder(
          //     builder: (context) =>
          //         IconButton(
          //           icon: Icon(Icons.settings),
          //           onPressed: () => Scaffold.of(context).openEndDrawer(),
          //           // onPressed: () => Navigator.of(context).pushNamed('settings'),

          //               .of(context)
          //               .openAppDrawerTooltip,
          //         ),
          //   ),
          // ],
        ),
        body: Placeholder(),
        // floatingActionButton: AddEntryButton(
        //   saveEntryFunc: saveEntry,), // This trailing comma makes auto-formatting nicer for build methods.

        bottomNavigationBar: NewEntryButton(),
      ),
      // initialRoute:  JournalScaffold.routeName,
    );
  }
}
