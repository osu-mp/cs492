import 'package:flutter/material.dart';
import '../models/food_waste_post.dart';
import '../styles.dart';

class SingleEntrySummary extends StatelessWidget {
  static  final String routeName = 'SingleEntrySummary';

  @override
  Widget build(BuildContext context) {
    final entry = ModalRoute.of(context)!.settings.arguments as FoodWastePost;


    return Scaffold(
      appBar: AppBar(title: Text(entry.dateStr), centerTitle: true,),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(entry.photoURL),
                SizedBox(height: 40,),
                Text('${entry.quantity.toString()} items', style: Styles.textHeader),
                SizedBox(height: 40,),
                Text(
                  'Location: (${entry.latitude.toString()}, ${entry.longitude.toString()})',
                  style: Styles.textSubHeading,
                ),

              ],
            )
        ),
      ),
    );
  }

}