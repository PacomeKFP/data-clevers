part of user.model;

class Competence {
  final String id;
  final String title;
  final String domain;

  Competence(this.id, this.title, this.domain);

  Map<String, dynamic> toJson() =>
      {'_id': id, 'title': title, 'domain': domain};

  factory Competence.fromJson(Map<String, dynamic> json) =>
      Competence(json['_id'], json['title'], json['domain']);
}
