import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  static const routeName = 'settings';
  final bool initValue;
  final Function(bool) darkModeToggle;

  const SettingsDrawer({super.key,
    required this.initValue,
    required this.darkModeToggle,
  });

  @override
  State<SettingsDrawer> createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(title: Text('Settings', textAlign: TextAlign.center,)),
          SwitchListTile(
              title: const Text('Dark Mode'),
              value: widget.initValue,
              onChanged: (bool value) {
                widget.darkModeToggle(value);
              })
        ],
      ),
    );
  }
}