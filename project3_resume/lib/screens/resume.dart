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
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // children: jobWidgets,
                children: [
                  Text(widget._person.name, style: Styles.textDefault, ),
                  //textLauncher(_person.phone, 'sms:${_person./**/phone}'),
                  textLauncher(widget._person.email, 'mailto:${widget._person.email}'),
                  textLauncher(widget._person.personalURL, widget._person.personalURL),
                  for(var job in widget._person.jobs) jobWidget(job, context),
                  // jobWidgets,
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget jobWidget(JobDesc job, context){
    return Container(
      child: Column(

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
          // Divider(color: Theme.of(context).primaryColor, height: 20, thickness: 4,
          // indent: 40, endIndent: 40,),

           // TODO : call super in stateless constructors
        ],
      ),
    );
  }

  Widget getJobWidgets(List<JobDesc> jobs){
    return Row(children: jobs.map((item) => Text(item.title)).toList());
    //return Text(jobs.map((item) => new )

    //return new Row(children: strings.map((item) => new Text(item)).toList());
  }

  Widget example(BuildContext context){
    return  DefaultTextStyle(
      style: Theme.of(context).textTheme.bodyMedium!,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: <Widget>[
                    Container(
                      // A fixed-height child.
                      color: const Color(0xffeeee00), // Yellow
                      height: 120.0,
                      alignment: Alignment.center,
                      child: const Text('Fixed Height Content'),
                    ),
                    Expanded(
                      // A flexible child that will grow to fit the viewport but
                      // still be at least as big as necessary to fit its contents.
                      child: Container(
                        color: const Color(0xffee0000), // Red
                        height: 120.0,
                        alignment: Alignment.center,
                        child: const Text('Flexible Content'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
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




