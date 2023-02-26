import 'package:sqflite/sqflite.dart';
import 'journal_entry_dto.dart';

class DatabaseManager {

  static const String DATABASE_FILENAME = 'journal.sqlite3.db';
  static const String SQL_CREATE_SCHEMA = 'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, body TEXT, rating INTEGER, date TEXT';
  static const String SQL_INSERT = 'INSERT INTO journal_entries(title, body, rating, date) values(?, ?, ?, ?)';
  static const String SQL_SELECT = 'SELECT * FROM journal_entries';

  static DatabaseManager _instance = DatabaseManager._();

  late final Database db;

  DatabaseManager._();// : db = database;

  factory DatabaseManager.getInstance(){
    assert(_instance != null);
    return _instance;
  }

  static Future initialize() async {
    final db = await openDatabase(DATABASE_FILENAME,
        version: 1,
        onCreate: (Database db, int version) async {
          createTables(db, SQL_CREATE_SCHEMA);
        }
    );

    _instance = DatabaseManager._();
  }

  static void createTables(Database db, String sql) async {
    await db.execute(sql);
  }

  void saveJournalEntry({required JournalEntryDTO dto}){
    db.transaction( (txn) async {
      await txn.rawInsert(SQL_INSERT,
      [dto.title, dto.body, dto.rating, dto.dateTime.toString()]
      );
    });
  }

  // Future<List<JournalEntry>> journalEntries() async {
  //     final journalRecords = await db.rawQuery(SQL_SELECT);
  //     final journalEntries = journalRecords.map( (record) {
  //       return JournalEntry(
  //         title: record['title'],
  //         body: record['body'],
  //         rating: record['rating'],
  //         dateTime: DateTime.parse(record['dateTime']),
  //       ).toList();
  //     });
  //
  //     return journalEntries;
  // }
}

// import 'database_manager.dart';
void dummy_main() async {
  await DatabaseManager.initialize();
  final DatabaseManager dbManager = DatabaseManager.getInstance();
}
