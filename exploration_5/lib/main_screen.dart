import 'package:flutter/material.dart';
import 'package:untitled/components/centered_placeholder.dart';

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({Key? key, required this.title}) : super(key: key);
  @required
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      //body: CenteredPlaceholder(padding: 50),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [placeholderRow(), placeholderRow()],

      )

    );
  }

  Widget paddedPlaceholder(){
    return const Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Placeholder(),
      ),
    );
  }

  Widget placeholderRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [paddedPlaceholder(), paddedPlaceholder()
      ],);
  }
}
