import 'package:intl/intl.dart';

class JournalEntry {
  late final int id;
  final String title;
  final String body;
  final int rating;
  final DateTime dateTime;

  String get dateTimeStr => DateFormat('EEEE, MMMM dd, y').format(dateTime);

  JournalEntry({
    required this.title,
    required this.body,
    required this.rating,
    required this.dateTime,
    this.id = -1,
  });

}
