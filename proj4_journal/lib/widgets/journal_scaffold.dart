import 'package:flutter/material.dart';
import 'package:proj4_journal/screens/welcome.dart';
import '../models/journal_entry.dart';
import '../screens/journal_entry_list.dart';

class JournalScaffold extends StatefulWidget {

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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (widget.records.length == 0){
      return  WelcomeScreen();
    }
    return JournalEntryList(records: widget.records);
  }
}