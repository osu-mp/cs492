import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/settings_drawer.dart';
import 'db/database_manager.dart';
import 'db/journal_entry_dto.dart';

const DARK_MODE_KEY = 'DarkModeEnabled';

class JournalApp extends StatefulWidget {
  final SharedPreferences preferences;

  JournalApp({Key? key, required this.preferences}) : super(key: key){
    dbInit();
  }

  void dbInit() async {

    var dbManager = DatabaseManager.getInstance();
    for (var i = 0; i < 5; i++) {
      JournalEntryDTO dto = JournalEntryDTO();
      dto.title = 'Title $i';
      dto.dateTime = DateTime.now();
      dto.rating = 4;
      dto.body = 'Some body text for item $i';
      dbManager.saveJournalEntry(dto: dto);
      print('Saved dummy entry $i}');
    }

  }


  static final routes = {
    // SettingsDrawer.routeName: (context) => SettingsDrawer(),
  };

  @override
  State<JournalApp> createState() => _JournalAppState();
}

class _JournalAppState extends State<JournalApp> {
  bool get darkMode => widget.preferences.getBool(DARK_MODE_KEY) ?? false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Adaptive Layouts',
      // routes: JournalApp.routes,
      theme: darkMode ? ThemeData.dark(): ThemeData(),
      home: Scaffold(
        endDrawer: SettingsDrawer(
            initValue: darkMode,
            darkModeToggle: (bool value){
              setState(() {
                widget.preferences.setBool(DARK_MODE_KEY, value);
              });
          },
        ),
          appBar: AppBar(
            title: Text('Journal Entries',),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  // onPressed: () => Navigator.of(context).pushNamed('settings'),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
          ),

          body:
        Text('Blah')
      ),
    );
  }
}



