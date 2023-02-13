import '../models/personal_info.dart';

final person = PersonalInfo(photoAssetPath: 'assets/images/face.png',
    name: 'Matthew Pacey',
    title: 'Senior Software Developer',
    phone: '785-393-1528',
    personalURL: 'https://github.com/osu-mp',
    email: 'paceym@oregonstate.edu',
  jobs: [
    JobDesc(title: 'Graduate Research Assistant',
        company: 'OSU',
        dateRange: '2023-Present',
        location: 'Corvallis, OR',
        description: '''Assisted on the Machine Common Sense program, a DARPA funded AI program to mimic the learning and behavior of 18 month old toddlers. Designed and developed scene detector to determine what type of puzzle to solve based on environmental cues. Used machine learning and vision technologies and delivered solutions to external cusomters.'''),
    JobDesc(title: 'Product Development Engineer',
        company: 'Intel',
        dateRange: '2007-2023',
        location: 'Hillsboro, OR',
        description: 'Software engineer creating internal tools critical to post silicon validation. Designed and maintained several tools used for pattern generation in high volume manufacturing. Debugged software and supported users to enable content generation. Regularly commended for continuous improvement and quality code reviews that improved code team-wide. Promoted multiple times, currently a Grade 7 Engineer.'),
    JobDesc(title: 'Technical Intern',
        company: 'Rockwell Collins',
        dateRange: '2006',
        location: 'Cedar Rapids, IA',
        description: 'Assisted in the development of a ground-based software tool for the Navigation Systems Team. Utilized test driven development techniques to develop verification software.'),
    JobDesc(title: 'Technical Intern',
        company: 'Honeywell Aerospace',
        dateRange: '2002-2005',
        location: 'Olathe, KS',
        description: '''Started as a mentored intern as a High School Senior and returned as a full-time intern during
undergraduate summers. Worked directly with pilots to develop integrated cockpit displays in
OpenGL and C++. Used constant communication with pilots to adjust displays.
        ''')
  ]
);
