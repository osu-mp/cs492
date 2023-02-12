import 'package:flutter/material.dart';
import 'screens/business_card.dart';
import 'screens/job_predictor.dart';

class MainTabs extends StatelessWidget {
  static const tabs = [
    Tab(text: 'Business Card',
      icon: Icon(
        Icons.face, semanticLabel: 'Business Card',
      ),),
    Tab(text: 'Resume',
      icon: Icon(
        Icons.contact_page, semanticLabel: 'Resume',
      ),),
    Tab(text: 'Questions',
      icon: Icon(
        Icons.question_mark, semanticLabel: 'Questions',
      ),),
  ];

  final screens = [BusinessCard(), Placeholder(), JobPredictor()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
            appBar: AppBar(
                title: Center(child: Text('Call Me Matthew')),
                bottom: TabBar(tabs: tabs)
            ),
            body: TabBarView(children: screens)
        ));
  }
}
