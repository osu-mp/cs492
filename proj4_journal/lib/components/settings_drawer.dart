import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  static const routeName = 'settings';

  const SettingsDrawer({super.key});

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {


  bool _lights = false;
  bool _darkMode = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width * 0.7;

    return Drawer(
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(title: Text('Settings', textAlign: TextAlign.center,)),
            // ElevatedButton(
            //   onPressed: _closeEndDrawer,
            //   child: const Text('Close Drawer'),
            // ),
            SwitchListTile(
                title: const Text('Dark Mode'),
                value: _darkMode,
                onChanged: (bool value){
              setState(() {
                _darkMode = value;
              });
                })
          ],
        ),
      );

    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: _lights,
      onChanged: (bool value) {
        setState(() {
          _lights = value;
        });
      },
 //     secondary: const Icon(Icons.lightbulb_outline),
    );
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text('Drawer Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: _openEndDrawer,
          child: const Text('Open End Drawer'),
        ),
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('This is the Drawer'),
              ElevatedButton(
                onPressed: _closeEndDrawer,
                child: const Text('Close Drawer'),
              ),
            ],
          ),
        ),
      ),
      // Disable opening the end drawer with a swipe gesture.
      endDrawerEnableOpenDragGesture: false,
    );
  }
}