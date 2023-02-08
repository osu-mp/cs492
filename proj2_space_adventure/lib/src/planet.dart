class Planet {
  final String name;
  final String desc;

  Planet(this.name, this.desc);

  Planet.nullPlanet()
      : name = 'Null',
        desc = 'Null';

  factory Planet.fromJson(dynamic json) {
    return Planet(json['name'] as String, json['description'] as String);
  }
}
