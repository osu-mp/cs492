import 'package:flutter/material.dart';
import 'package:proj4_journal/db/journal_entry_dto.dart';


class JournalEntryForm extends StatefulWidget{

  static const String routeName = 'JOURNAL_ENTRY_FORM';

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  final formKey = GlobalKey<FormState>();
  final journalEntryValues = JournalEntryDTO();

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
                    // store value in object
                    },
                    validator: (value){
                      if (value!.isEmpty){
                        return 'Please entry a title';
                      }
                      return null;
                    },
                  ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Body', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: 'Rating', border: OutlineInputBorder()),
                ),
                SizedBox(height: 10),
                ElevatedButton(onPressed: (){
                  if (formKey.currentState!.validate()){
                    formKey.currentState!.save();
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