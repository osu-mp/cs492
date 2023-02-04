import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:math';
import 'dart:io';
import 'planet.dart';

class PlanetarySystem {
  final Random _random = Random();
  String name = 'Unnamed System';
  List<Planet> planets;

  PlanetarySystem(this.name, this.planets);

  factory PlanetarySystem.fromJson(Map<String, dynamic> json) {
    var planetsObjJson = json['planets'] as List;
    List<Planet> _planets = planetsObjJson
        .map((planetJson) => Planet.fromJson(planetJson))
        .toList();

    // extract name and planets from json object
    return PlanetarySystem(json['name'] as String, _planets);
  }

  int get planetCount => planets.length;
  bool get hasPlanets => planets.isNotEmpty;

  Planet randomPlanet() {
    if (!hasPlanets) return Planet.nullPlanet();
    return planets[_random.nextInt(planets.length)];
  }

  String getPlanetsString() {
    var list = [];
    planets.forEach((element) {
      list.add(element.name);
    });

    return list.join(', ');
  }

  Planet planetWithName(String name) {
    return planets.firstWhere((planet) => planet.name == name,
        orElse: () => Planet.nullPlanet());
  }
}
