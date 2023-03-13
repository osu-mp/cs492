import 'package:flutter/material.dart';

class WasteDetailEntry extends StatefulWidget{
  static  final String routeName = 'WasteDetailEntry';

  WasteDetailEntry({Key? key}) : super(key: key);

  @override
  State<WasteDetailEntry> createState() => _WasteDetailEntryState();
}

class _WasteDetailEntryState extends State<WasteDetailEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Post'), centerTitle: true,),
      body: Text('bas'),
    );
  }
}