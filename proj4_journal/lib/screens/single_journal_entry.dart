import 'dart:core';
import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import '../journal_app.dart';
import '../styles.dart';

class SingleJournalEntry extends StatefulWidget {
  static const String routeName = 'SingleJournalEntry';
  late final JournalEntry entry;
  bool includeScaffold = true;

  SingleJournalEntry({Key? key}) : super(key: key);
  SingleJournalEntry.Entry({Key? key, required this.entry}): super(key: key){

    includeScaffold = false;
  }
  @override
  State<SingleJournalEntry> createState() => _SingleJournalEntryState();
}

class _SingleJournalEntryState extends State<SingleJournalEntry> {
  late final JournalEntry entry;

  @override
  void initState(){
    super.initState();

    if (widget.includeScaffold) {
      // final JournalEntry entry = ModalRoute.of(context).settings?.arguments;
      JournalAppState? state = context.findAncestorStateOfType<
          JournalAppState>();
      // print('entry $entry}');
      entry = state!.getSelectedEntry();
    } else {
      entry = widget.entry;
    }


  }

  @override
  Widget build(BuildContext context) {
    List<Widget> rating = [Text('Rating ', style: Styles.textSubHeading,)];
    for (int i = 0; i < entry.rating; i++) {
      rating.add(Icon(Icons.star));
    }
    if (!widget.includeScaffold){
      return mainEntryWidget(rating);
    }
    return Scaffold(
      appBar: AppBar(title: Text(entry.dateTimeStr),),
      body: InkWell(child: mainEntryWidget(rating),

        onTap: (){
          Navigator.of(context).pop();
        },
    )
    );
  }

  Padding mainEntryWidget(List<Widget> rating) {
    return Padding(
    padding: EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(entry.title, style: Styles.textHeader, textAlign: TextAlign.start,),
            Padding(padding: EdgeInsets.all(3)),
            defaultDivider(context),
            Row(children: rating),
            Padding(padding: EdgeInsets.all(3)),
            defaultDivider(context),
            Text(entry.body, style: Styles.textDefaultSmall),
          ],
        ),
      ),
      
    );
  }
}
