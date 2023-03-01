import 'package:flutter/material.dart';
import 'package:proj4_journal/screens/welcome.dart';
import '../models/journal_entry.dart';
import '../screens/journal_entry_list.dart';

class JournalScaffold extends StatefulWidget {
  // final DatabaseManager dbManager;
  static final String routeName = 'JOURNAL_SCAFFOLD';
  List<JournalEntry> records;

  JournalScaffold({Key? key, required List<JournalEntry> this.records}) : super(key: key){}

  @override
  State<JournalScaffold> createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {

  void initState(){
    getJournalEntries();
  }

  void getJournalEntries() async {
    widget.records = await widget.records;
    setState(() {
      print('Total entries found ${widget.records.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    print('BUILD of JOURNAL SCAFFOLD');
    print('Total entries found ${widget.records.length}');
    if (widget.records.length == 0){
      return  WelcomeScreen();
    }
    // return
    return JournalEntryList(records: widget.records);
  }
}