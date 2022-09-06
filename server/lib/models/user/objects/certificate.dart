part of user.model;

class Certificate {
  final String id;
  final String name;
  final String domain;
  final DateTime date;

  get getCollection async => await Model.getCollection("certificates");

  Certificate(this.id, this.name, this.domain, this.date);

  Map<String, dynamic> toJson() =>
      {'_id': id, 'name': name, 'domain': domain, 'date': date};

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      Certificate(json['_id'], json['name'], json['domain'], json['date']);
}
