part of user.model;

class Experience {
  final String id;
  final String title;
  final String employer;
  final String? employerUrl;
  final String? employerContact;
  final String? domain;
  final DateTime? begin;
  final DateTime? end;

  Experience(this.id, this.title, this.employer, this.employerUrl,
      this.employerContact, this.domain, this.begin, this.end);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'title': title,
        'employer': employer,
        'employerUrl': employerUrl,
        'employerContact': employerContact,
        'domain': domain,
        'begin': begin,
        'end': end
      };

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
      json['_id'],
      json['title'],
      json['employer'],
      json['employerUrl'],
      json['employerContact'],
      json['domain'],
      json['begin'],
      json['end']);
}
