import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class FoodWastePost {
  late DateTime date;
  late String photoURL;
  late int quantity;
  late double latitude;
  late double longitude;

  String get dateStr => DateFormat('EEEE, MMMM dd, y').format(date);

  FoodWastePost.empty();

  FoodWastePost({
    required DateTime this.date,
    required String this.photoURL,
    required int this.quantity,
    required double this.latitude,
    required double this.longitude,
  });

  factory FoodWastePost.fromMap(Map<String, dynamic> json){
    return FoodWastePost(
        date: (json['date'] as Timestamp).toDate(),
        photoURL: json['photoURL'],
        quantity: json['quantity'],
        latitude: json['latitude'],
        longitude: json['longitude']
    );
  }
}