library user.model;
part 'objects/language.dart';
part 'objects/education.dart';
part 'objects/experience.dart';
part 'objects/certificate.dart';
part 'objects/competence.dart';

class User{
  final String id;
  final String name;
  final String userName;
  final String email;
  final String password;
  final String biography;
  final List<String> interest;
  final List<Language> languages;
  final List<Education> educations;
  final List<Experience> experiences;
  final List<Certificate> certificates;
  final List<Competence> competences;

  User(this.id, this.name, this.userName, this.email, this.password, this.biography, this.interest, this.languages, this.educations, this.experiences, this.certificates, this.competences);


}