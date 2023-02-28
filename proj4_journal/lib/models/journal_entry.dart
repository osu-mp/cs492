
class JournalEntry {
  final int id;
  final String title;
  final String body;
  final int rating;
  final DateTime dateTime;

  JournalEntry({required this.id,
    required this.title,
    required this.body,
    required this.rating,
    required this.dateTime});

  // String toString() =>
  //     'Title $title, Body $body, Rating $rating, Date: $dateTime';
}
