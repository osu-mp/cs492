import 'package:flutter/material.dart';
import 'package:proj4_journal/screens/welcome.dart';
import '../db/database_manager.dart';
import '../models/journal_entry.dart';

class JournalScaffold extends StatefulWidget {
  // final DatabaseManager dbManager;
  static final String routeName = 'JOURNAL_SCAFFOLD';
  List<JournalEntry> records;

  JournalScaffold({Key? key, required List<JournalEntry> this.records}) : super(key: key){}

  @override
  State<JournalScaffold> createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {
  List<JournalEntry> records = [];

  void initState(){
  //  getJournalEntries();
  }

  // void getJournalEntries() async {
  //   records = await widget.dbManager.journalEntries();
  //   setState(() {
  //     print('Total entries found ${records.length}');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    if (records.length == 0){
      return  WelcomeScreen();
    }
    // return
    return Text('journal app with ${records.length} entries');
  }
}