import '../models/personal_info.dart';

final person = PersonalInfo(photoAssetPath: 'assets/images/face.png',
    name: 'Matthew Pacey',
    title: 'Software Developer',
    phone: '785 393 1528',
    personalURL: 'https://github.com/osu-mp',
    email: 'paceym@oregonstate.edu',
  jobs: [
    JobDesc(title: 'Graduate Research Assistant',
        company: 'OSU',
        dateRange: '2023-Present',
        location: 'Corvallis, OR',
        description: 'Description'),
    JobDesc(title: 'Product Development Engineer',
        company: 'Intel',
        dateRange: '2007-2023',
        location: 'Hillsboro, OR',
        description: 'Software engineer creating internal tools critical to post silicon validation. Designed and maintained several tools used for pattern generation in high volume manufacturing. Debugged software and supported users to enable content generation. Regularly commended for continuous improvement and quality code reviews that improved code team-wide. Promoted multiple times, currently a Grade 7 Engineer.'),
    JobDesc(title: 'Technical Intern',
        company: 'Rockwell Collins',
        dateRange: '2006',
        location: 'Cedar Rapids, IA',
        description: 'Assisted in the development of a ground-based software tool for the Navigation Systems Team. Utilized test driven development techniques to develop verification software.')
  ]
);
