import 'package:flutter/material.dart';
import '../models/predictor_answer.dart';
import '../styles.dart';

class JobPredictor extends StatefulWidget {
  @override
  State<JobPredictor> createState() => _JobPredictorState();
}


class _JobPredictorState extends State<JobPredictor> {
  final predictorAnswer = PredictorAnswer();

  @override
  Widget build(BuildContext context) {
    //predictorAnswer
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Call Me... Maybe', style: Styles.textDefault,),
        Padding(padding: EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () { setState(() {
              predictorAnswer.randomAnswer();
            });},
            child: Text('Ask a question... tap for an answer',
            style: Styles.textDefaultSmall),
          ),
        ),
        Text('${predictorAnswer.currentAnswer}', style: Styles.textDefault,)
      ],
    );
    return Text('Predictor');

 }

}
