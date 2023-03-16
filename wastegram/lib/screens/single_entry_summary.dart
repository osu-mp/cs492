import 'package:flutter/material.dart';
import '../models/food_waste_post.dart';
import '../styles.dart';

class SingleEntrySummary extends StatelessWidget {
  static const String routeName = 'SingleEntrySummary';

  const SingleEntrySummary({super.key});

  @override
  Widget build(BuildContext context) {
    final entry = ModalRoute.of(context)!.settings.arguments as FoodWastePost;


    return Scaffold(
      appBar: AppBar(title: Text(entry.dateStr), centerTitle: true,),
      body:
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40,),
                Expanded(child: Image.network(entry.photoURL)),
                SizedBox(height: 40,),
                Text('${entry.quantity.toString()} items', style: Styles.textHeader),
                SizedBox(height: 40,),
                Text(
                  'Location: (${entry.latitude.toString()}, ${entry.longitude.toString()})',
                  style: Styles.textSubHeading,
                ),
                SizedBox(height: 40,),
              ],
            )
        ),
    );
  }

}