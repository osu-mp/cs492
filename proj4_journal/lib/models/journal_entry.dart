import 'package:intl/intl.dart';

class JournalEntry {
  final String title;
  final String body;
  final int rating;
  final DateTime dateTime;

  String get dateTimeStr => DateFormat('EEEE, MMMM dd, y').format(dateTime);

  JournalEntry({
    required this.title,
    required this.body,
    required this.rating,
    required this.dateTime});


  // String toString() =>
  //     'Title $title, Body $body, Rating $rating, Date: $dateTime';
}
