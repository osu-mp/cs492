import 'dart:math';

class Die {
  final Random random = Random();
  final int numberOfSides;
  int _currentValue = 1;

  Die({this.numberOfSides = 4});

  int get currentValue => _currentValue;

  void roll() {
    _currentValue = 1 + random.nextInt(numberOfSides);
  }
}