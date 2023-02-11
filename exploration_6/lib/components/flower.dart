import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/die.dart';

class Flower extends StatefulWidget {
  @override
  State createState() => _FlowerState();

    // return FractionallySizedBox(
    //   widthFactor: 0.8,
    //   heightFactor: 0.8,
    //   child: Padding(
    //       padding: EdgeInsets.all(padding(context)),
    //       child: GestureDetector(
    //           onTap: (){ displaySnackBar(context); },
    //           child: Image.asset('assets/flower.png')),
    //   ),
    // );

    void displaySnackBar(BuildContext context){
      final snackBar = SnackBar(content: Text('Flower Power!'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    double padding(BuildContext context){
      if (MediaQuery.of(context).orientation == Orientation.landscape){
        return MediaQuery.of(context).size.width * 0.05;
      } else {
        return MediaQuery.of(context).size.width * 0.1;
      }
    }
}

class _FlowerState extends State<Flower>{
  final die = Die(numberOfSides: 20);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${die.currentValue}', style: Theme
            .of(context)
            .textTheme
            .headline4),
        Padding(padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () { setState(() {
              // die.roll();
              // launch('sms:55555555555');
              launch('https://flutter.dev');
            });},
            child: Image.asset('assets/flower.png'),
          ),)
      ],
    );
  }
}