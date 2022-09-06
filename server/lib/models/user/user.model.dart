library user.model;

import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:server/models/models.dart';

part 'objects/language.dart';
part 'objects/education.dart';
part 'objects/experience.dart';
part 'objects/certificate.dart';
part 'objects/competence.dart';

class UserModel {
  final String id;
  final String uid;
  final String name;
  final String userName;
  final String email;
  final String? password;
  final String? biography;
  // final AuthMethod? authMethod;
  final List<String>? interests;
  final List<Language>? languages;
  final List<Education>? educations;
  final List<Experience>? experiences;
  final List<Certificate>? certificates;
  final List<Competence>? competences;

  static Future<DbCollection> getCollection() async =>
      await Model.getCollection("users").then((collection) => collection);

  UserModel._(
      {required this.id,
      required this.uid,
      required this.name,
      required this.userName,
      required this.email,
      // this.authMethod,
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
        'uid': uid,
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
  static Future<UserModel?> fromJson(Map<String, dynamic> json) async {
    DbCollection users = await getCollection();

    return await users
            .find({'userName': json['userName']})
            .toList()
            .then((user) => user.isNotEmpty)
        ? null
        : UserModel._(
            id: json['_id'],
            name: json['name'],
            uid: json['uid'],
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
                .map<Experience>(
                    (experience) => Experience.fromJson(experience))
                .toList(),
            certificates: (json['certificates'] as List<Map<String, dynamic>>)
                .map<Certificate>(
                    (certificate) => Certificate.fromJson(certificate))
                .toList(),
            competences: (json['competences'] as List<Map<String, dynamic>>)
                .map<Competence>(
                    (competence) => Competence.fromJson(competence))
                .toList());
  }
}
