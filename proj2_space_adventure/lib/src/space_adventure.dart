import 'dart:io';
import 'dart:math';
import 'planetary_system.dart';
import 'planet.dart';

class SpaceAdventure {
  PlanetarySystem planetarySystem;

  SpaceAdventure({required this.planetarySystem});

  void start() {
    printGreeting();
    printIntroducion(responseToPrompt('What is your name?'));
    if (planetarySystem.hasPlanets) {
      travel(promptForRandomOrSpecficDest(
          'Shall I randomly choose a planet for you to visit? (Y or N)'));
    } else {
      print('Aw, ther are no planets to explore.');
    }
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are ${planetarySystem.planetCount} planets to explore');
  }

  void printIntroducion(String name) {
    print(
        'Nice to meet you, $name. My name is Eliza, I\'m an old fried of Alexa.');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync() ?? '';
  }

  void travel(bool randomOrNot) {
    Planet planet;
    if (randomOrNot) {
      planet = planetarySystem.randomPlanet();
    } else {
      planet = planetarySystem.planetWithName(
          responseToPrompt('Name the planet you would like to visit.'));  
      while (planet == Planet.nullPlanet()){
        print(
          'A planet by that name cannot be found in ${planetarySystem.name}.\n'
          'Please pick a planet from this list: ${planetarySystem.getPlanetsString()}');
        var response = responseToPrompt('Name the planet you would like to visit.');
        planet = planetarySystem.planetWithName(response);
    }    
    }
    travelToPlanet(planet);
  }

  bool promptForRandomOrSpecficDest(String prompt) {
    print('Let\'s go on an adventure!');
    String answer = '';
    while (answer != 'Y' && answer != 'Y') {
      answer =
          responseToPrompt(prompt).toUpperCase(); // make it easier on users
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      } else {
        print('Sorry, I did not understand.');
      }
    }

    return false;
  }

  bool travelToPlanet(Planet planet) {
    print('Travelling to ${planet.name}');
    print('Arrived at ${planet.name}. ${planet.desc}');
    return true;
  }

  bool travelTo([planet]) {
    if (planetarySystem.hasPlanets) return false;

    if (planet == null) {
      var planetNum = Random().nextInt(this.planetarySystem.planets.length);
      planet = this.planetarySystem.planets[planetNum].name;
    }

    // var planetFound = false;
    var destinationPlanet = planetarySystem.planetWithName(planet);
    
    // planetarySystem.planets.forEach((element) {
    //   if (planet == element.name) {
    //     print('Travelling to $planet.\n'
    //         '${element.desc}');
    //     planetFound = true;
    //   }
    // });

    // if (planetFound) return true;

    // planet not found
    

    return false;
  }
}
