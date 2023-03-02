import 'package:flutter/material.dart';
import '../models/journal_entry.dart';
import 'single_journal_entry.dart';
import '../journal_app.dart';
import '../styles.dart';

class JournalEntryList extends StatefulWidget{
  static  final String routeName = 'JOURNAL_LIST';

  final List<JournalEntry> records;

  JournalEntryList({Key? key, required List<JournalEntry> this.records}) : super(key: key);

  @override
  State<JournalEntryList> createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {
  bool _landscape = false;
  JournalEntry? _landscapeEntry;

  @override
  void initState(){
    // JournalAppState? state = context.findAncestorStateOfType<JournalAppState>();
     //_landscapeEntry = widget.records[0];
  }
  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape){
      _landscape = true;
      // JournalAppState? state = context.findAncestorStateOfType<JournalAppState>();
      // JournalEntry entry = widget.records[0];
      // if (state != null && state!.records.isNotEmpty){
      //   //entry = Placeholder();state!.getSelectedEntry();
      //   _landscapeEntry = widget.records[0];
      // }
      // print('ENTRY $entry');
      Widget rightPane = Text('Select an entry from the left');
      if (_landscapeEntry != null){
        rightPane = Expanded(child:
        SizedBox(child: SingleJournalEntry.Entry(entry: _landscapeEntry!),));
      }



    return Row(
        children: [
          Expanded(
              child:
              SizedBox(
                //height: 200,
                  child: buildJournalList(context)),),

         rightPane,
        ],
      );
    }
    else _landscape = false;
    return buildJournalList(context);
  }

  Widget buildJournalList(BuildContext context) {
    return ListView(

        children: [Container(
          // color: Colors.orange,
          child: Align(
            alignment: Alignment.topLeft,
            //padding: EdgeInsets.all(1),
      child: Column(
            children: widget.records.map((item) {
              return ListTile(
                title: Text(item.title,textAlign: TextAlign.start,
                        style: Styles.textHeader),
                subtitle: Text(item.dateTimeStr,
                      style: Styles.textSubHeading),
                onTap: (){
                  print('show ${item.title}');
                  JournalAppState? state = context.findAncestorStateOfType<JournalAppState>();
                  // print('entry $entry}');
                  state!.setSelectedEntry(item.id);

                  if (_landscape){
                    JournalAppState? state = context.findAncestorStateOfType<JournalAppState>();

                    _landscapeEntry = state!.getSelectedEntry();
                    setState(() {

                    });
                  }
                  else {
                    Navigator.of(context).pushNamed(SingleJournalEntry
                        .routeName);
                  }
              },
              );
              // return Column(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(item.title,
              //       textAlign: TextAlign.start,
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              //     Text(item.dateTime.toString(),
              //         style: TextStyle(fontSize: 14)
              //     ),
              //     Padding(padding: EdgeInsets.all(8)),
              //   ],
              // );
            }).toList()
      ),
          ),
        ),],
    );
  }
}