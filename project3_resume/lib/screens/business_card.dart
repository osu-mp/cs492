import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final person = PersonalInfo(photoAssetPath: 'assets/images/face.png',
      name: 'Matthew Pacey',
      title: 'Software Developer',
      phone: '785 393 1528',
      personalURL: 'https://github.com/osu-mp',
      email: 'paceym@oregonstate.edu');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.5;
    if (MediaQuery.of(context).orientation == Orientation.landscape){
      print('landscape');
      return
          Row(
            children: [
              roundedProfilePhoto(context, person.photoAssetPath),
              Spacer(),
              Expanded( child: contactInfo(context)
              ),
              ],
          );
    }
    else {
      print('portrait');
      return Column(
          children: [

            roundedProfilePhoto(context, person.photoAssetPath),
            contactInfo(context),

          ],
      );
    }
  }


  Widget contactInfo(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      // textBaseline: TextBaseline.ideographic,
      children: [
        Text(person.name, style: Styles.textDefault,),
        Text(person.title, style: Styles.textDefaultSmall,),
        textLauncher(person.phone, 'sms:${person.phone}'),
        textLauncher(person.personalURL, person.personalURL),
        textLauncher(person.email, 'mailto:${person.email}'),

      ],
    );
  }

  Widget textLauncher(String text, String launchUrl, {int fontSize=12}){
    return Padding(padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () { setState(() {
          launch(launchUrl);
        });},
        child: Text(text, style: Styles.textDefaultSmall,),
      ),
    );
  }

  Widget roundedProfilePhoto(BuildContext context, String imagePath){
    final size = MediaQuery.of(context).size.width * 0.5;
    final borderRadius = BorderRadius.circular(10); // Image border

    return Container(
      padding: EdgeInsets.all(3), // Border width
      decoration: BoxDecoration(color: Theme.of(context).primaryColorLight, borderRadius: borderRadius),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: SizedBox.fromSize(
          size: Size.fromRadius(48), // Image radius
          child: Image.asset(imagePath, fit: BoxFit.cover, width: size, height: size,),
        ),
      ),
    );

    return CircleAvatar(
      radius: 48,
      backgroundColor: Theme.of(context).primaryColorDark,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipOval(
          child: Image.asset(imagePath, width: size, height: size,),

        )
      )
    );
  }
}
