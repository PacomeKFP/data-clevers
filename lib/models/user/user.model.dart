library user.model;

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
part 'objects/language.dart';
part 'objects/education.dart';
part 'objects/experience.dart';
part 'objects/certificate.dart';
part 'objects/competence.dart';

class User {
  final String id;
  final String name;
  final String userName;
  final String email;
  final String? password;
  final String? biography;
  final List<String>? interests;
  final List<Language>? languages;
  final List<Education>? educations;
  final List<Experience>? experiences;
  final List<Certificate>? certificates;
  final List<Competence>? competences;

  User._(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      this.password,
      this.biography,
      this.interests,
      this.languages,
      this.educations,
      this.experiences,
      this.certificates,
      this.competences});


  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'userName': userName,
        'email': email,
        'password': password,
        'biography': biography,
        'interests': interests,
        'languages': languages!.map((language) => language.toJson()).toList(),
        'educations':
            educations!.map((education) => education.toJson()).toList(),
        'experiences':
            experiences!.map((experience) => experience.toJson()).toList(),
        'certificates':
            certificates!.map((certificate) => certificate.toJson()).toList(),
        'competences':
            competences!.map((competence) => competence.toJson()).toList(),
      };
  factory User.fromJson(Map<String, dynamic> json) =>
     User._(
        id: json['_id'],
        name: json['name'],
        userName: json['userName'],
        email: json['email'],
        password: json['password'],
        biography: json['biography'],
        interests: json['interests'],
        languages: (json['languages'] as List<Map<String, dynamic>>)
            .map<Language>((language) => Language.fromJson(language))
            .toList(),
        educations: (json['educations'] as List<Map<String, dynamic>>)
            .map<Education>((education) => Education.fromJson(education))
            .toList(),
        experiences: (json['experiences'] as List<Map<String, dynamic>>)
            .map<Experience>((experience) => Experience.fromJson(experience))
            .toList(),
        certificates: (json['certificates'] as List<Map<String, dynamic>>)
            .map<Certificate>(
                (certificate) => Certificate.fromJson(certificate))
            .toList(),
        competences: (json['competences'] as List<Map<String, dynamic>>)
            .map<Competence>((competence) => Competence.fromJson(competence))
            .toList());
  

  Future<void> saveInPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('currentUser', json.encode(toJson()));
  }
}
