import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/personal_info.dart';
import '../styles.dart';

class Resume extends StatefulWidget {
  final PersonalInfo _person;

  Resume(this._person);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    var jobWidgets = getJobWidgets(widget._person.jobs);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight,),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget._person.name, style: Styles.textDefault, ),
                  textLauncher(widget._person.email, 'mailto:${widget._person.email}'),
                  textLauncher(widget._person.personalURL, widget._person.personalURL),
                  for(var job in widget._person.jobs) jobWidget(job, context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget jobWidget(JobDesc job, context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        defaultDivider(context),
        Text(job.title, style: Styles.textHeading1,),
        Padding(padding: EdgeInsets.all(3)),
        Row(children: [
          Expanded(child: Text(job.company, style: Styles.textHeading2,)),
          Expanded(
              child: Text(job.dateRange, style: Styles.textHeading2, textAlign: TextAlign.center,)),
          Expanded(
              child: Text(job.location, style: Styles.textHeading2, textAlign: TextAlign.right,)),
        ],
        ),
        Padding(padding: EdgeInsets.all(3)),
        Text(job.description, textAlign: TextAlign.justify, style: Styles.textDefaultExtraSmall,),
        Padding(padding: EdgeInsets.all(3)),

      ],
    );
  }

  Widget getJobWidgets(List<JobDesc> jobs){
    return Row(children: jobs.map((item) => Text(item.title)).toList());
  }

  Widget textLauncher(String text, String launchUrl, {int fontSize=12}){
    return Padding(padding: EdgeInsets.all(4),
      child: GestureDetector(
        onTap: () { setState(() {
          launch(launchUrl);
        });},
        child: Text(text, style: Styles.textDefaultSmall,),
      ),
    );
  }
}




