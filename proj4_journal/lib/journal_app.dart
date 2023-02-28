import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/settings_drawer.dart';

const DARK_MODE_KEY = 'DarkModeEnabled';

class JournalApp extends StatefulWidget {
  final SharedPreferences preferences;

  const JournalApp({Key? key, required this.preferences}) : super(key: key);

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
            title: Text('Journal Entries'),
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



