import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/food_waste_post.dart';
import '../widgets/new_entry_button.dart';
import 'single_entry_summary.dart';
import '../styles.dart';

class FoodWasteListScreen extends StatefulWidget {
  static const String routeName = 'FoodWasteList';

  FoodWasteListScreen({Key? key}) : super(key: key);

  @override
  State<FoodWasteListScreen> createState() => _FoodWasteListScreenState();

}


class _FoodWasteListScreenState extends State<FoodWasteListScreen> {
  late int _waste_sum = 0;

  @override
  void initState(){
    super.initState();
    retrieveData();
  }

  void retrieveData() async {
    int sum = 0;
    await FirebaseFirestore.instance
        .collection('food_waste')
        .get()
        .then((QuerySnapshot snapshot) {
          snapshot.docs.forEach((element) {
            print('elem');
            sum += element["quantity"].round() as int;
          });
      }
    );
    print('WASTE SUM $_waste_sum');
    if (_waste_sum != sum){
      setState(() {
        _waste_sum = sum;
      });
    }

    // setState(() {
    //   _waste_sum = sum;
    // });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Wastegram ${_waste_sum}'), centerTitle: true,),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('food_waste')
            .orderBy('date', descending: true)
            .snapshots(),
        builder: (context, snapshot){
          if (snapshot.hasError){
            return Center(
                child: Text("Error reading from database", style: Styles.textSubHeading,));
          }
          if (!snapshot.hasData) {
            return Center(
                child: const CircularProgressIndicator());
          }
          else if (snapshot.data!.docs.isEmpty) {
            return Center(
                child: Text('Create entries with the button at bottom',
                    style: Styles.textSubHeading),
            );
          }

          // print("SADAS");
          // snapshot.data!.docs.forEach((element) {
          //   widget._waste_sum = widget._waste_sum + element["quantity"].round() as int;
          //
          // });
          // print("BLAH ${widget._waste_sum}");
          // if (snapshot.connectionState == ConnectionState.done) {
          //   snapshot.data!.docs.forEach((element) {
          //     widget._waste_sum = widget._waste_sum + element["quantity"].round() as int;
          //
          //   });
          //   print("BLAH ${widget._waste_sum}");
          //

          // }
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