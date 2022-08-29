part of user.model;

class Education {
  final String id;
  final String diploma;
  final String? school;
  final DateTime? begin;
  final DateTime? end;

  Education(this.id, this.diploma, this.school, this.begin, this.end);

  Map<String, dynamic> toJson() => {
        '_id': id,
        'diploma': diploma,
        'school': school,
        'begin': begin,
        'end': end
      };

  factory Education.fromJson(Map<String, dynamic> json) => Education(
      json['_id'], json['diploma'], json['school'], json['begin'], json['end']);
}
