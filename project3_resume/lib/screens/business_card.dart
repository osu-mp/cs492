import 'package:flutter/material.dart';
import 'package:project3_resume/models/personal_info.dart';
import '../models/predictor_answer.dart';
import '../models/personal_info.dart';
import '../styles.dart';

/*
    The structure of the layout should be similar to what is shown in the example above.
The information here can be made up, to honor your privacy.
When tapping the phone number, the device's text messaging app should appear.
When tapping the web site url, a web browser should appear and display that web page.
You should use text sizes, styles, fonts, and colors on this screen. For example, a colored non-white background with white fancy text.
Use your photo, or a any avatar photo, instead of the Placeholder shown in the example above.
     */

class BusinessCard extends StatefulWidget {
  @override
  State<BusinessCard> createState() => _BusinessCardState();
}

class _BusinessCardState extends State<BusinessCard> {
  // TODO: make person an input to this class
  final person = PersonalInfo(photo:  Image.asset('assets/images/face.png'),
      name: 'Matthew Pacey',
      title: 'Software Developer',
      phone: '785 393 1528',
      personalURL: 'https://github.com/osu-mp',
      email: 'paceym@oregonstate.edu');

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape){
      return Expanded(
          child: Row(
            children: [person.photo, contactInfo(context)],
          ));
    }
    else {
      return Column(
          children: [
            Image.asset('assets/images/face.png',
              width: 200,
              height: 200,),
            contactInfo(context),

          ],
      );
    }
  }

  Widget contactInfo(BuildContext context) {
    return Column(children: [
      Text(person.name, style: Styles.textDefault,),
      Text(person.title, style: Styles.textDefaultSmall,),
      Text(person.phone, style: Styles.textDefaultSmall,),
      Row(
        children: [
          Text('https://github.com/osu-mp'),
          Text('paceym@oregonstate.edu')
        ],
      ),
    ],);
  }
}
