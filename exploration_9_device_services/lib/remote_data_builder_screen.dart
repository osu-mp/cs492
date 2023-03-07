import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'character.dart';

class RemoteDataBuilderScreen extends StatefulWidget {
  static final url = Uri.parse('https://swapi.dev/api/people/3');


  const RemoteDataBuilderScreen({super.key});

  @override
  RemoteDataScreenState createState() => RemoteDataScreenState();
}

class RemoteDataScreenState extends State<RemoteDataBuilderScreen> {
  Future<http.Response> apiResponse = http.get(RemoteDataBuilderScreen.url);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: apiResponse,
        builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
          Widget child;
          if (snapshot.hasData) {
            Character character =
                Character.fromJSON(jsonDecode(snapshot.data!.body));
            child = Text(character.name);
          } else if (snapshot.hasError) {
            child = Text('Failed getting info from url ${RemoteDataBuilderScreen.url}');
          }
          else {
            child = const CircularProgressIndicator();
          }

          return Center(child: child);
        });
  }
}
