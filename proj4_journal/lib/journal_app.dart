import 'package:flutter/material.dart';
import 'components/settings_drawer.dart';

class JournalApp extends StatelessWidget {

  static final routes = {
    SettingsDrawer.routeName: (context) => SettingsDrawer(),
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Adaptive Layouts',
      routes: routes,
      home: Scaffold(
        endDrawer: SettingsDrawer(),
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
}



