import 'package:flutter/material.dart';
import '../components/flower.dart';

class MainScreen extends StatelessWidget {
  final String title;

  const MainScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(child: Flower(),),
    );
  }


}