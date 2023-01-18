import 'package:proj2_space_adventure/dart_space_adventure.dart';
import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  // TODO arg checking
  String jsonStr = File(arguments[0]).readAsStringSync();
  PlanetarySystem system = PlanetarySystem.fromJson(jsonDecode(jsonStr));
  SpaceAdventure(planetarySystem: system).start();
}
