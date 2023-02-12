import 'dart:math';

class PredictorAnswer {
  final Random random = Random();
  final List<String> _answers = [
    'Yes',
    'No'
  ];
  
  String getRandomAnswer(){
    return _answers[random.nextInt(_answers.length)];
  }
}