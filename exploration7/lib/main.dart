import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp,
  ]);
  //runApp(const MyApp());
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Adaptive Layouts',
      home: Scaffold(
        appBar: AppBar(title: Text('Adaptive Layouts'),),
        body:
          // Container(
          // //constraints: BoxConstraints(maxHeight: 300, maxWidth: 400, minWidth: 400),
          // child: LayoutBuilder(builder: (context, constraints){
          //   return constraints.maxWidth < 500 ? VerticalLayout() : HorizontalLayout();
          // }),
          // ),
          AdaptiveWidget(),
      ),
    );
  }
}

class AdaptiveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}

class VerticalLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.lightGreen);
  }
}

class HorizontalLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(color: Colors.lightGreen)),
        Expanded(child: Container(color: Colors.orange)),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explorations 7',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Adaptive Layouts')),
        body: Center(child: Text('Builder Demo'),),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SNAACK')));
        //   },
        // ),
        // floatingActionButton: SnackFab(),
        floatingActionButton: Builder(builder: (context){
          return FloatingActionButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SNAACK2')));
          });
        },),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SNAACK')));
        }
        // tooltip: 'Increment',
        // child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SnackFab extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return FloatingActionButton(onPressed: (){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SNAACK')));
    });
  }

}