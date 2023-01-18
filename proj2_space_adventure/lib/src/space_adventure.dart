import 'dart:io';
import 'dart:math';
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
    print('There are ${planetarySystem.planets.length} planets to explore');
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
    if (randomOrNot) {
      travelTo();
    } else {
      var travelled = false;
      while (travelled == false) {
        travelled = travelTo(
            responseToPrompt('Name the planet you would like to visit.'));
      }
    }
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

  bool travelTo([planet]) {
    if (planet == null) {
      var planetNum = Random().nextInt(this.planetarySystem.planets.length);
      planet = this.planetarySystem.planets[planetNum].name;
    }

    for (final element in this.planetarySystem.planets) {
      if (planet == element.name) {
        print('Travelling to $planet.\n'
            '${element.desc}');
        return true;
      }
    }

    // planet not found
    print(
        'A planet by the name of "$planet" cannot be found in ${planetarySystem.name}.\n'
        'Please pick a planet from this list: ${planetarySystem.getPlanetsString()}');

    return false;
  }
}
