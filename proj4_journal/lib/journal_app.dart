import 'package:flutter/material.dart';
import 'package:proj4_journal/widgets/journal_entry_form.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'widgets/settings_drawer.dart';
import 'db/database_manager.dart';
import 'db/journal_entry_dto.dart';
import 'widgets/journal_scaffold.dart';
import 'models/journal_entry.dart';
import 'screens/journal_entry_list.dart';
import 'screens/single_journal_entry.dart';

const DARK_MODE_KEY = 'DarkModeEnabled';

class JournalApp extends StatefulWidget {
  final SharedPreferences preferences;
  late final DatabaseManager dbManager;

  JournalApp({Key? key, required this.preferences}) : super(key: key){
    dbInit();
  }

  void dbInit() async {

    dbManager = DatabaseManager.getInstance();
    // for (var i = 0; i < 5; i++) {
    //   JournalEntryDTO dto = JournalEntryDTO();
    //   dto.title = 'Title $i';
    //   dto.date = DateTime.now().toString();
    //   dto.rating = i % 5;
    //   dto.body = 'Some body text for item $i';
    //   dbManager.saveJournalEntry(dto: dto);
    //   print('Saved dummy entry $i with timestamp of ${dto.date}');
    // }

  }

  @override
  State<JournalApp> createState() => JournalAppState();
}

class JournalAppState extends State<JournalApp> {
  bool get darkMode => widget.preferences.getBool(DARK_MODE_KEY) ?? false;
  List<JournalEntry> records = [];
  int selectedIndex = 0;

  String title = 'Welcome';

  void initState() {
    getJournalEntries();
  }

  JournalEntry getSelectedEntry() {
    return records
        .where((i) => i.id == selectedIndex)
        .first;
  }

  void setSelectedEntry(int id) {
    selectedIndex = id;
  }

  void getJournalEntries() async {
    records = await widget.dbManager.journalEntries();

    setState(() {
      if (records.length > 0) {
        title = 'Journal';
      }
    });
  }

  void saveEntry(JournalEntryDTO dto) async {
    widget.dbManager.saveJournalEntry(dto: dto);
    getJournalEntries();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal App',
      routes: {
        JournalEntryForm.routeName: (context) =>
            JournalEntryForm(saveEntryFunc: saveEntry,),
        JournalEntryList.routeName: (context) =>
            JournalEntryList(records: records),
        SingleJournalEntry.routeName: (context) => SingleJournalEntry(),
      },
      theme: darkMode ? ThemeData.dark() : ThemeData(),
      home: Scaffold(
        endDrawer: SettingsDrawer(
          initValue: darkMode,
          darkModeToggle: (bool value) {
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
              builder: (context) =>
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    // onPressed: () => Navigator.of(context).pushNamed('settings'),
                    tooltip: MaterialLocalizations
                        .of(context)
                        .openAppDrawerTooltip,
                  ),
            ),
          ],
        ),
        body: JournalScaffold(records: records),
        floatingActionButton: AddEntryButton(
          saveEntryFunc: saveEntry,), // This trailing comma makes auto-formatting nicer for build methods.
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

