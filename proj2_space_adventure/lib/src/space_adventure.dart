import 'dart:io';
import 'planetary_system.dart';

class SpaceAdventure {
  PlanetarySystem planetarySystem;

  SpaceAdventure({required this.planetarySystem});

  void start() {
    printGreeting();
    printIntroducion(responseToPrompt('What is your name?'));
    travel(promptForRandomOrSpecficDest(
        'Shall I randomly choose a planet for you to visit? (Y or N)'));
  }

  void printGreeting() {
    print('Welcome to the ${planetarySystem.name}!');
    print('There are 8 planets to explore');
  }

  void printIntroducion(String name) {
    print(
        'Nice to meet you, $name. My name is Eliza, I\'m an old fried of Alexa');
  }

  String responseToPrompt(String prompt) {
    print(prompt);
    return stdin.readLineSync() ?? '';
  }

  void travel(bool randomOrNot) {
    if (randomOrNot) {
      travelToRandomPlanet();
    } else {
      travelTo(responseToPrompt('Name the planet you would like to visit.'));
    }
  }

  bool promptForRandomOrSpecficDest(String prompt) {
    print('Let\'s go on an adventure!');
    String answer = '';
    while (answer != 'Y' && answer != 'Y') {
      answer = responseToPrompt(prompt);
      if (answer == 'Y') {
        return true;
      } else if (answer == 'N') {
        return false;
      }
    }

    return false;

    print('');
    print('Type the planey you would like to visit');
    var planet = 'Neptune';
    print('Travelling to $planet...');
    print('Arrive at $planet. A very cold planet, furthest from the sun.');
  }

  void travelToRandomPlanet() {
    print('Random');
  }

  void travelTo(planet) {
    print('Travel $planet');
  }
}
