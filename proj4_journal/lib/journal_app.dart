import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'components/settings_drawer.dart';
import 'constants.dart';

class JournalApp extends StatefulWidget {
  final SharedPreferences preferences;
  // final Function(bool) darkModeChanged;

  JournalApp({Key? key, required this.preferences}) : super(key: key);

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
            preferences: widget.preferences,
            darkModeChanged: () {
              setState(() {
                bool a = false;
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
        // Container(
        // //constraints: BoxConstraints(maxHeight: 300, maxWidth: 400, minWidth: 400),
        // child: LayoutBuilder(builder: (context, constraints){
        //   return constraints.maxWidth < 500 ? VerticalLayout() : HorizontalLayout();
        // }),
        // ),
        //AdaptiveWidget(),
        Text('Blah')
      ),
    );
  }

  void update() {
    setState(() {
      var a = 1;
    });
  }
}



