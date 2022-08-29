part of user.model;

class Language {
  final String id;
  final String name;
  final int level;

  Language(this.id, this.name, this.level);

  Map<String, dynamic> toJson() => {'_id': id, 'name': name, 'level': level};

  factory Language.fromJson(Map json) =>
      Language(json['_id'], json['name'], int.parse(json['level']));
}
