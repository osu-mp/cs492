import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';


class FoodWastePost {
  late final DateTime date;
  late final String photoURL;
  late final int quantity;
  late final double latitude;
  late final double longitude;

  String get dateStr => DateFormat('EEEE, MMMM dd, y').format(date);


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