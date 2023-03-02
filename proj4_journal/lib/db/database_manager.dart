import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'journal_entry_dto.dart';
import '../models/journal_entry.dart';

const SCHEMA_FILE_PATH = 'assets/journal_schema_1.txt';

class DatabaseManager {

  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_INSERT = 'INSERT INTO journal_entries(title, body, rating, date) values(?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';

  static late DatabaseManager _instance;

  late final Database db;

  DatabaseManager._({required Database database}) : db = database;

  factory DatabaseManager.getInstance(){
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    // print('Deleting database: $DATABASE_FILENAME}');
    // await deleteDatabase(DATABASE_FILENAME);

    // get schema
    String dbSchema = await rootBundle.loadString(SCHEMA_FILE_PATH);

    final db = await openDatabase(DATABASE_FILENAME,
        version: 1,
        onCreate: (Database db, int version) async {
          createTables(db, dbSchema);
        }
    );

    _instance = DatabaseManager._(database: db);
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({required JournalEntryDTO dto})  {
    db.transaction( (txn) async {
      await txn.rawInsert(SQL_INSERT,
        [dto.title, dto.body, dto.rating, dto.date.toString()]
      );
    });
  }

  Future<List<JournalEntry>> journalEntries() async {
      final journalRecords = await db.rawQuery(SQL_SELECT);
      final  journalEntries = journalRecords.map( (record) {
        return JournalEntry(
          title: record['title'].toString(),
          body: record['body'].toString(),
          rating: int.parse(record['rating'].toString()),
          dateTime: DateTime.parse(record['date'].toString()),
          id: int.parse(record['id'].toString()),
        );
      }).toList();

      return journalEntries;
  }
}