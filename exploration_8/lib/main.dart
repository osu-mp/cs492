import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App(preferences: await SharedPreferences.getInstance()));
}

// void printKeys() async {
//   // Future<SharedPreferences> prefs = SharedPreferences.getInstance();
//   // prefs.then( (value) {
//   //   print(value.getKeys());
//   // });
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //print(prefs.getKeys());
//   print('Done');
// }