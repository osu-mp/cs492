import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_waste_post.dart';
import '../widgets/new_entry_button.dart';
import 'single_entry_summary.dart';

class FoodWasteListScreen extends StatefulWidget {
  static const String routeName = 'FoodWasteList';

  const FoodWasteListScreen({Key? key}) : super(key: key);

  @override
  State<FoodWasteListScreen> createState() => _FoodWasteListScreenState();
}


class _FoodWasteListScreenState extends State<FoodWasteListScreen> {
  
  // Widget _buildListItem(BuildContext context, DocumentSnapshot document){
  //   return ListTile(
  //     title: Row(
  //       children: [
  //         Expanded(child: Text())
  //       ],
  //     )
  //   )
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wastegram'), centerTitle: true,),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('food_waste')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot){
          if (!snapshot.hasData)
            return const CircularProgressIndicator();

          if (snapshot.data!.docs.isEmpty)
            return const Text('No entries found, use button at bottom to create an entry');
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                // var post = snapshot.data!.docs[index];
                FoodWastePost entry = FoodWastePost.fromMap(snapshot.data!.docs[index].data());
                return ListTile(
                  title: Text(entry.dateStr),
                  trailing: Text(entry.quantity.toString()),
                  onTap: (){
                    Navigator.of(context).pushNamed(
                      SingleEntrySummary.routeName,
                      arguments: entry,
                    );
                  },
                );
            },
          );
        },
      ),
      bottomNavigationBar: NewEntryButton(),
    );
  }
}