import 'dart:io';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const API_KEY_PATH = 'assets/api_key.txt';

class App extends StatefulWidget{
  final SharedPreferences preferences;

  App({Key? key, required this.preferences}) : super(key: key);

  @override
  AppState createState() =>     AppState();


}

class AppState extends State<App>{
  static const FAVORITE_THING_KEY = 'favoriteThing';
  String apiKey = 'Empty';
  String get favoriteThing => widget.preferences.getString(FAVORITE_THING_KEY) ?? 'clean code';

  void initState() {
    super.initState();
    initSecretKey();
    initDoc();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exploration 8',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Exploration 8'),),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              favoriteThing == null ? CircularProgressIndicator() :
              Text(favoriteThing,
                style: Theme.of(context).textTheme.headline4?.copyWith(color: Colors.white)),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: pickNewFavoriteThing, child: Text('Pick New Favorite Thing')),
              Text('Secret key: ${apiKey}'),
              ElevatedButton(onPressed: doDatabaseOperation, child: Text('Do a DB Thing')),
            ],
          ),
        ),
      ),
    );
  }

  void pickNewFavoriteThing(){
    setState(() {
      widget.preferences.setString(FAVORITE_THING_KEY, generateWordPairs().take(1).first.join(' '));
    });
  }

  void doDatabaseOperation() async{
    await deleteDatabase('journal.db');
    print('SAVE TO DB');
    final Database database = await openDatabase(
        'journal.db', version: 1, onCreate: (Database db, int version) async{
          await db.execute('CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY, title TEXT)');
    });

    await database.transaction((txn) async {
      await txn.rawInsert('INSERT INTO journal_entries(title) VALUES(?)',
      ['my_title1']);
    });

    await database.transaction((txn) async {
      await txn.rawInsert('INSERT INTO journal_entries(title) VALUES(?)',
          ['my_title1']);
    });

    List<Map> records = await database.rawQuery('SELECT * from journal_entries');
    print(records);


    await database.close();
    print('DB CLOSED');
  }

  void initSecretKey() async {
    print('Getting key');
    String key = await getSecretKey();
    print('Key: ${key}');
    setState( (){
      WidgetsFlutterBinding.ensureInitialized();
      apiKey = key;
    });
  }
  Future<String> getSecretKey() {
    return rootBundle.loadString(API_KEY_PATH);
  }

  void initDoc() async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String documentsPath = documentsDir.path;
    
    final File file = File('$documentsPath/example.txt');
    await file.writeAsString('Important data here');
  }
}
