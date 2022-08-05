part of models;

class Language {
  final String name;
  final String abbr;
  final int level;

  Language({required this.abbr, required this.name, this.level = 1});

  set level(int lvl) => level = lvl;
}