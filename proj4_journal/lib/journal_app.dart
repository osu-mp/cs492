import 'package:flutter/material.dart';
import 'package:proj4_journal/screens/welcome.dart';
import 'package:proj4_journal/widgets/journal_entry_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/settings_drawer.dart';
import 'db/database_manager.dart';
import 'db/journal_entry_dto.dart';
import 'widgets/journal_scaffold.dart';
import 'models/journal_entry.dart';
import '../screens/journal_entry_list.dart';

const DARK_MODE_KEY = 'DarkModeEnabled';

class JournalApp extends StatefulWidget {
  final SharedPreferences preferences;
  late final DatabaseManager dbManager;

  JournalApp({Key? key, required this.preferences}) : super(key: key){
    dbInit();
  }

  void dbInit() async {

    dbManager = DatabaseManager.getInstance();
    for (var i = 0; i < 18; i++) {
      JournalEntryDTO dto = JournalEntryDTO();
      dto.title = 'Title $i';
      dto.date = DateTime.now().toString();
      dto.rating = 4;
      dto.body = 'Some body text for item $i';
      dbManager.saveJournalEntry(dto: dto);
      print('Saved dummy entry $i with timestamp of ${dto.date}');
    }

    var entries = await dbManager.journalEntries();
    print('Count of entries ${entries.length}');
  }


  final routes = {
    // SettingsDrawer.routeName: (context) => SettingsDrawer(),
    JournalEntryForm.routeName: (context) => JournalEntryForm(saveEntryFunc: (JournalEntryDTO dto){},)
    // JournalScaffold.routeName: (context) => JournalScaffold(dbManager: dbManager);
    // WelcomeScreen.routeName: (context) => WelcomeScreen(),
  };

  @override
  State<JournalApp> createState() => _JournalAppState();
}

class _JournalAppState extends State<JournalApp> {
  bool get darkMode => widget.preferences.getBool(DARK_MODE_KEY) ?? false;
  List<JournalEntry> records = [];

  String title = 'Welcome';

  void initState(){
    print("INIT OF JOURNAL APP");
    getJournalEntries();
  }

  void getJournalEntries() async {
    records = await widget.dbManager.journalEntries();

    setState(() {
      if (records.length > 0){
        title = 'Journal';
        // Navigator.of(context).pop();
        // Navigator.of(context).pushNamed(routeName)
      }
      print('Total entries found ${records.length}');
    });
  }

  void saveEntry(JournalEntryDTO dto) async {
    print("SAVING DTO: $dto");
    widget.dbManager.saveJournalEntry(dto: dto);
    getJournalEntries();
    // setState(() {
    //   print("SAVED");
    // });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal App',
      routes: {
        JournalEntryForm.routeName: (context) => JournalEntryForm(saveEntryFunc: saveEntry,),
        JournalEntryList.routeName: (context) => JournalEntryList(records: records),
      },
      theme: darkMode ? ThemeData.dark(): ThemeData(),
      home: Scaffold(
        endDrawer: SettingsDrawer(
            initValue: darkMode,
            darkModeToggle: (bool value){
              setState(() {
                widget.preferences.setBool(DARK_MODE_KEY, value);
              });
          },
        ),
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  // onPressed: () => Navigator.of(context).pushNamed('settings'),
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
          ),

          body: JournalScaffold(records: records),


        floatingActionButton: AddEntryButton(saveEntryFunc: saveEntry,), // This trailing comma makes auto-formatting nicer for build methods.
      ),
      // initialRoute:  JournalScaffold.routeName,
    );
  }
}

class AddEntryButton extends StatelessWidget{
  late Function(JournalEntryDTO dto) saveEntryFunc;

  AddEntryButton({Key? key, required this.saveEntryFunc}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: (){
        Navigator.of(context).pushNamed(JournalEntryForm.routeName, arguments: saveEntryFunc);

      },
      tooltip: 'Add New Journal Entry',
      child: const Icon(Icons.add),
    );
  }

}

