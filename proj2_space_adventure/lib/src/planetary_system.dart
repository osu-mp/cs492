import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:io';

class PlanetarySystem {
  //final String cfgPath;
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

  String getPlanetsString() {
    var list = [];
    planets.forEach((element) {
      list.add(element.name);
    });

    return list.join(', ');
  }
}

class Planet {
  String name;
  String desc;

  Planet(this.name, this.desc);

  factory Planet.fromJson(dynamic json) {
    return Planet(json['name'] as String, json['description'] as String);
  }
}
