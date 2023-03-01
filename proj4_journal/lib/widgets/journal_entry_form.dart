import 'package:flutter/material.dart';
import 'package:proj4_journal/db/journal_entry_dto.dart';
import '../db/database_manager.dart';

class JournalEntryForm extends StatefulWidget{

  static const String routeName = 'JOURNAL_ENTRY_FORM';

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntryValues = JournalEntryDTO();
  JournalEntryDTO _newEntry = JournalEntryDTO();

  late final DatabaseManager dbManager = DatabaseManager.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('New Journal Entry',),
        ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Title', border: OutlineInputBorder()),
                    onSaved: (value){
                      _newEntry.title = value!;
                    },
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please enter a title';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Body', border: OutlineInputBorder()),
                  onSaved: (value){
                    _newEntry.body = value!;
                  },
                  validator: (value){
                    if (value!.isEmpty){
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Rating', border: OutlineInputBorder()),
                  onSaved: (value){
                    _newEntry.rating = int.parse(value!);
                  },
                  validator: (value){
                    if ((value!.isEmpty) || (1 > int.parse(value!)) || (int.parse(value!) > 4)){
                      print('You entered $value ');
                      return 'Please enter a rating from 1 to 4';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: (){
                  if (formKey.currentState!.validate()){
                    _newEntry.date = DateTime.now().toString();
                    formKey.currentState!.save();
                    dbManager.saveJournalEntry(dto: _newEntry);
                    Navigator.of(context).pop();
                  }
                  formKey.currentState!.save();
                },
                    child: Text('Save Entry'),
                  ),
              ],



      ),
      ),
      ),
    );
  }
}