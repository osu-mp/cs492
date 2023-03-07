import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'character.dart';

class RemoteDataScreen extends StatefulWidget {
  static final url = Uri.parse('https://swapi.dev/api/people/1');

  const RemoteDataScreen({super.key});

  @override
  RemoteDataScreenState createState() => RemoteDataScreenState();
}

class RemoteDataScreenState extends State<RemoteDataScreen> {
  Character? character;

  @override
  void initState() {
    super.initState();
    retrieveCharacterData();
  }

  void retrieveCharacterData() async {
    final http.Response apiResponse = await http.get(RemoteDataScreen.url);
    character = Character.fromJSON(jsonDecode(apiResponse.body));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (character == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Center(child: Text(character!.name));
    }
  }
}