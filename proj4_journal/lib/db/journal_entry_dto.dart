class JournalEntryDTO {
  late String title;
  late String body;
  late int rating;
  late String date;

  String toString() =>
      'Title $title, Body $body, Rating $rating, Date: $date';
}