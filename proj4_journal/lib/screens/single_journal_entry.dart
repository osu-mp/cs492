import 'dart:core';
import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import '../journal_app.dart';
import '../styles.dart';

class SingleJournalEntry extends StatefulWidget {
  static const String routeName = 'SingleJournalEntry';
  //JournalEntry entryAA;

  SingleJournalEntry({Key? key}) : super(key: key);

  @override
  State<SingleJournalEntry> createState() => _SingleJournalEntryState();
}

class _SingleJournalEntryState extends State<SingleJournalEntry> {
  late final JournalEntry entry;

  @override
  void initState(){
    super.initState();
    // final JournalEntry entry = ModalRoute.of(context).settings?.arguments;
    JournalAppState? state = context.findAncestorStateOfType<JournalAppState>();
    // print('entry $entry}');
    entry = state!.getSelectedEntry();

  }

  @override
  Widget build(BuildContext context) {
    List<Icon> rating = [];
    for (int i = 0; i < entry.rating; i++) {
      rating.add(Icon(Icons.star));
    }
    return Scaffold(
      appBar: AppBar(title: Text(entry.dateTimeStr),),
      body: Padding(
      padding: EdgeInsets.all(8),
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(entry.title, style: Styles.textHeader, textAlign: TextAlign.start,),
              Padding(padding: EdgeInsets.all(3)),
              Row(children: rating),
              Padding(padding: EdgeInsets.all(3)),
              Text(entry.body, style: Styles.textDefaultSmall),
            ],
          ),
        ),
      ),
    );
  }
}