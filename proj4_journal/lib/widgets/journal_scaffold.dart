import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../models/journal_entry.dart';

class JournalScaffold extends StatefulWidget {
  final DatabaseManager dbManager;
  static final String routeName = 'JOURNAL_SCAFFOLD';

  JournalScaffold({Key? key, required DatabaseManager this.dbManager}) : super(key: key){
  }

  @override
  State<JournalScaffold> createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {

  void initState(){
    getJournalEntries();
  }

  void getJournalEntries() async {
    List<JournalEntry> records = await widget.dbManager.journalEntries();
    print('Total entries found ${records.length}');
  }

  @override
  Widget build(BuildContext context) {
    // return
    return Text('journal app');// ${widget.dbManager.journalEntries().length()}');
  }
}