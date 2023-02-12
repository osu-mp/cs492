import 'package:flutter/material.dart';
import '../styles.dart';

class JobPredictor extends StatefulWidget {
  @override
  State<JobPredictor> createState() => _JobPredictorState();
}


class _JobPredictorState extends State<JobPredictor> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Call Me... Maybe', style: Styles.textDefault,),
        Text('Ask A Question... tap for the answer.'),
        Text('Mesage')
      ],
    );
    return Text('Predictor');

 }

}

class PredictorAnswer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  
}