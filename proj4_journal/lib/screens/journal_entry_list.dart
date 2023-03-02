import 'package:flutter/material.dart';
import 'single_journal_entry.dart';
import '../models/journal_entry.dart';
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
  Widget build(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.landscape) {
      _landscape = true;
      Widget rightPane = Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Select an entry from the left to view here',
              style: Styles.textHeader,),
          ));
      if (_landscapeEntry != null) {
        rightPane = Expanded(child:
        SizedBox(child: SingleJournalEntry.Entry(entry: _landscapeEntry!),));
      }
      return Row(
        children: [
          Expanded(child: SizedBox(
              child: buildJournalList(context)),
          ),
          rightPane,
        ],
      );
    }
    // else portrait mode
    _landscape = false;
    return buildJournalList(context);
  }

  Widget buildJournalList(BuildContext context) {
    return ListView(
      children: [Container(
        child: Align(
          alignment: Alignment.topLeft,
          child: Column(
              children: widget.records.map((item) {
                return ListTile(
                  title: Text(item.title, textAlign: TextAlign.start,
                      style: Styles.textHeader),
                  subtitle: Text(item.dateTimeStr,
                      style: Styles.textSubHeading),
                  onTap: () {
                    JournalAppState? state = context.findAncestorStateOfType<
                        JournalAppState>();
                    state!.setSelectedEntry(item.id);
                    if (_landscape) {
                      JournalAppState? state = context.findAncestorStateOfType<
                          JournalAppState>();
                      _landscapeEntry = state!.getSelectedEntry();
                      setState(() {});
                    }
                    else {
                      Navigator.of(context).pushNamed(SingleJournalEntry
                          .routeName);
                    }
                  },
                );
              }).toList()
          ),
        ),
      ),
      ],
    );
  }
}