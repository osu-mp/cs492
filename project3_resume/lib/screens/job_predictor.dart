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
            // not a button
            child: magic8BallSwitcher('Ask a question... tap for answer', context),
            // child: Text('OLD Ask a question... tap for an answer',
            // style: Styles.textDefaultSmall),
          ),
        ),
        Text('${predictorAnswer.currentAnswer}', style: Styles.textDefault,)
      ],
    );
    return Text('Predictor');

 }

 Widget magic8BallSwitcher(String label, BuildContext context){
   return Container(
     child: new Text (
         label,
         style: Styles.textDefaultSmall
         // style: new TextStyle(
         //     color: Colors.blue[500],
         //     fontWeight: FontWeight.w900
         // )
     ),
     decoration: new BoxDecoration (
         borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
         color: Theme.of(context).primaryColorLight
     ),
     padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
   );
 }

}
