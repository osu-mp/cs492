class PersonalInfo {
  final String photoAssetPath;
  final String name;
  final String title;
  final String phone;
  final String personalURL;
  final String email;
  final List<JobDesc> jobs;

  PersonalInfo({
   required this.photoAssetPath,
    required this.name,
    required this.title,
    required this.phone,
    required this.personalURL,
    required this.email,
    required this.jobs,
});

}

class JobDesc {
  final String title;
  final String company;
  final String dateRange;
  final String location;
  final String description;

  JobDesc({
    required this.title,
    required this.company,
    required this.dateRange,
    required this.location,
    required this.description
  });
}