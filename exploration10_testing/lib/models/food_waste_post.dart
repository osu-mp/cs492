import 'dart:ffi';

class FoodWastePost {
  late final DateTime date;
  late final String photoURL;
  late final int quantity;
  late final double latitude;
  late final double longitude;

  FoodWastePost({
    required DateTime this.date,
    required String this.photoURL,
    required int this.quantity,
    required double this.latitude,
    required double this.longitude,
  });

  factory FoodWastePost.fromMap(Map<String, dynamic> json){
    return FoodWastePost(
        date: json['date'],
        photoURL: json['photoURL'],
        quantity: json['quantity'],
        latitude: json['latitude'],
        longitude: json['longitude']
    );
  }
}