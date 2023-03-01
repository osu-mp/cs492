import 'package:flutter/material.dart';
import '../models/journal_entry.dart';

class JournalEntryList extends StatefulWidget{
  static  final String routeName = 'JOURNAL_LIST';

  final List<JournalEntry> records;

  JournalEntryList({Key? key, required List<JournalEntry> this.records}) : super(key: key){}

  @override
  State<JournalEntryList> createState() => _JournalEntryListState();
}

class _JournalEntryListState extends State<JournalEntryList> {
  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                subtitle: Text(item.dateTimeStr,
                      style: TextStyle(fontSize: 14)

                  ),
                onTap: (){
                  print('show ${item.title}');

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