import 'dart:math';

class PredictorAnswer {
  final Random random = Random();
  String _currentAnswer = '';

  PredictorAnswer() {
    randomAnswer();
  }

  final List<String> _answers = [
    'Yes definitely',
    'Without a doubt',
    'Signs point to yes',
    'Cannot predict now',
    'Ask again later',
    'Don\'t count on it',
    'My sources say no',
    'Outlook not so good'
  ];

  String get currentAnswer => _currentAnswer;
  
  void randomAnswer(){
    _currentAnswer = _answers[random.nextInt(_answers.length)];
  }
}