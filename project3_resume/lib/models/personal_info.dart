import 'package:flutter/material.dart';

class PersonalInfo {
  final String photoAssetPath;
  final String name;
  final String title;
  final String phone;
  final String personalURL;
  final String email;

  PersonalInfo({
   required this.photoAssetPath,
    required this.name,
    required this.title,
    required this.phone,
    required this.personalURL,
    required this.email
});

}