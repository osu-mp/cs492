import 'package:flutter/material.dart';
import '../db/database_manager.dart';

class JournalScaffold extends StatefulWidget {
  final DatabaseManager dbManager;
  static final String routeName = 'JOURNAL_SCAFFOLD';

  JournalScaffold({Key? key, required DatabaseManager this.dbManager}) : super(key: key){
  }

  @override
  State<JournalScaffold> createState() => _JournalScaffoldState();
}

class _JournalScaffoldState extends State<JournalScaffold> {


  @override
  Widget build(BuildContext context) {
    // return
    return Text('journal app');// ${widget.dbManager.journalEntries().length()}');
  }
}